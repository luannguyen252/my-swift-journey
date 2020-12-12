//
//  TabButton.swift
//  PhotoMacApp
//
//  Created by Luan Nguyen on 12/12/2020.
//

import SwiftUI

struct TabButton: View {
    // MARK: - PROPERTIES
    var image: String
    var title: String
    var animation: Namespace.ID
    @Binding var selected: String

    // MARK: - BODY
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selected = title
            }
        }, label: {
            HStack {
                Image(systemName: image)
                    .font(.title2)
                    .foregroundColor(selected == title ? Color.black : black)
                    .frame(width: 25)
                
                Text(title)
                    .fontWeight(selected == title ? .semibold : .none)
                    .foregroundColor(selected == title ? Color.black : black)
                    .animation(.none)
                
                Spacer()

                ZStack {
                    Capsule()
                        .fill(Color.clear)
                        .frame(width: 3, height: 25)
                    
                    if selected == title {
                        Capsule()
                            .fill(Color.black)
                            .frame(width: 3, height: 25)
                            .matchedGeometryEffect(id: "Tab", in: animation)
                    }
                } //: ZSTACK
            } //: HSTACK
            .padding(.leading)
            .contentShape(Rectangle())
        }) //: BUTTON
        .buttonStyle(PlainButtonStyle())
    }
}

var black = Color.black.opacity(0.5)
