//
//  RecentlyTradedView.swift
//  FundTransferApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct RecentlyTradedView: View {
    // MARK: - PROPERTIES
    @ObservedObject var userManager = UserManager()
    @State var isRotating = false
    @ObservedObject var dragDrop: UserDragDrop
    @State var pickedUserName = "profile_user" // This use we did not use in circle
    public var viewSpace: Namespace.ID
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                MenuSelectionView(dragDrop: dragDrop, viewSpace: viewSpace)
                    .padding(.all, 2)

                RecentlyTradedTitleView()
                    .padding(.top, 20)

                ZStack {
                    RotationPathView(isRotating: $isRotating)

                    ForEach(userManager.userData) { user in
                        UserView(user: user)
                            .rotationEffect(.degrees(isRotating ? 360 : 0))
                            .animation(Animation.linear(duration: 10.0).repeatForever(autoreverses: false))
                            .opacity(userManager.userData[user.id].isDragging ? 0.0 : 1.0)
                            .gesture(
                                DragGesture(minimumDistance: 0)
                                    .onChanged({ value in
                                        if pickedUserName == "profile_user" {
                                            pickedUserName = user.imageName
                                            dragDrop.pickedUser = user
                                            dragDrop.shouldScoll = false
                                            dragDrop.dragDropConfig.isDragging = true
                                            userManager.changeUserDraggingValue(index: user.id)
                                        }
                                        // We need to continuously check the intersection
                                        dragDrop.checkRectEnter(location: value.location)
                                    })
                                    .onEnded({ value in
                                        userManager.changeUserDraggingValue(index: user.id)
                                        dragDrop.checkDrop()
                                        pickedUserName = "profile_user"
                                    })

                            )
                    }

                    // As it is difficult to drag a view which is already moving so we have be little creative, we will create a userview for draggin which is not moving. We need this user view rect position for intersection
                    GeometryReader { geo in
                        UserViewForDrag(user: dragDrop.pickedUser)
                            .offset(x: dragDrop.offsetValue.x - 30,
                                    y: dragDrop.offsetValue.y - 30) // 30 for radius of userView
                            .opacity(dragDrop.dragDropConfig.isDragging ? 1.0 : 0.0)
                            .onAppear {
                                dragDrop.userViewRect = geo.frame(in: .global)
                                dragDrop.dragUserMovingPoint = CGPoint(
                                    x: dragDrop.userViewRect.minX,
                                    y: dragDrop.userViewRect.minY)
                            }
                    } //: GEOMETRY READER
                    .frame(width: 60, height: 60)
                } //: ZSTACK
                .padding(.top, 30)
            } //: VSTACK
        }
        .onAppear {
            isRotating = true
        }
    }
}

// MARK: - RECENTLY TRADED TITLE VIEW
struct RecentlyTradedTitleView: View {
    // MARK: - BODY
    var body: some View {
        HStack {
            Text("Recently traded")
                .font(.system(size: 20, weight: .bold))

            Spacer()

            Image(systemName: "chevron.right")
        } //: HSTACK
    }
}
