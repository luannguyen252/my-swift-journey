//
//  Home.swift
//  StackingElements
//
//  Created by Luan Nguyen on 13/12/2020.
//

import SwiftUI

struct Home: View {
    // MARK: - PROPERTIES
    @State var photo_illustrations = [
        Photos(id: 0, image: "il_1", name: "Illustration 1", offset: 0,place: 1),
        Photos(id: 1, image: "il_2", name: "Illustration 2", offset: 0,place: 2),
        Photos(id: 2, image: "il_3", name: "Illustration 3", offset: 0,place: 3),
        Photos(id: 3, image: "il_4", name: "Illustration 4", offset: 0,place: 4),
        Photos(id: 4, image: "il_5", name: "Illustration 5", offset: 0,place: 5),
        Photos(id: 5, image: "il_6", name: "Illustration 6", offset: 0,place: 6),
        Photos(id: 6, image: "il_7", name: "Illustration 7", offset: 0,place: 7),
        Photos(id: 7, image: "il_8", name: "Illustration 8", offset: 0,place: 8),
        Photos(id: 8, image: "il_9", name: "Illustration 9", offset: 0,place: 9),
        Photos(id: 9, image: "il_10", name: "Illustration 10", offset: 0,place: 10),
    ]
    
    // To trach which card is swiped
    @State var swiped = 0
    @Namespace var name
    @State var selected: Photos =  Photos(id: 0, image: "sketch", name: "Sketch", offset: 0,place: 1)
    @State var show = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Illustrations")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        HStack(spacing: 4) {
                            Text("Expore 3D Illustrations")
                                .font(.system(size: 30))
                                .foregroundColor(Color.white.opacity(0.6))
                        } //: HSTACK
                    } //: VSTACK
                    
                    Spacer(minLength: 0)
                } // : HSTACK
                .padding()
                
                //: STACKED ELEMENTS
                GeometryReader { reader in
                    ZStack {
                        // Zstack will overlay on one another so revesing
                        ForEach(photo_illustrations.reversed()) { photo in
                            CardView(photo: photo, reader: reader, swiped: $swiped,show: $show,selected: $selected,name: name)
                                // Adding gesture
                                .offset(x: photo.offset)
                                .rotationEffect(.init(degrees: getRotation(offset: photo.offset)))
                                .gesture(DragGesture().onChanged({ (value) in
                                    withAnimation {
                                        // Only left swipe
                                        if value.translation.width > 0{
                                            photo_illustrations[photo.id].offset = value.translation.width
                                        }
                                    }
                                }).onEnded({ (value) in
                                    withAnimation {
                                        if value.translation.width > 150 {
                                            photo_illustrations[photo.id].offset = 1000
                                            // Updating Swipe id
                                            // since its starting from 0
                                            swiped = photo.id + 1
                                            restoreCard(id: photo.id)
                                        }
                                        else {
                                            photo_illustrations[photo.id].offset = 0
                                        }
                                    }
                                }))
                        }
                    }
                    .offset(y: -25)
                }
            }
            
            // MARK: - SHOW DETAIL VIEW
            if show {
                Detail(photo: selected, show: $show, name: name)
            }
        }
        .background (
            LinearGradient(gradient: .init(colors: [Color("top"),Color("center"),Color("bottom")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                // disabling bg color when its expanded...
                .opacity(show ? 0 : 1)
        )
    }
    
    // MARK: - ADDING CARD TO LAST
    func restoreCard(id: Int) {
        var currentCard = photo_illustrations[id]
        // Appending last
        currentCard.id = photo_illustrations.count
        photo_illustrations.append(currentCard)
        // Going back effect
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation {
                // Last one we appended
                photo_illustrations[photo_illustrations.count - 1].offset = 0
            }
        }
    }

    // MARK: - ROTATION
    func getRotation(offset: CGFloat) -> Double {
        let value = offset / 150
        // You can give your own angle here
        let angle: CGFloat = 5
        let degree = Double(value * angle)
        return degree
    }
}
