//
//  TabButton.swift
//  InstaPhotoMacApp
//
//  Created by Luan Nguyen on 26/12/2020.
//

import SwiftUI

struct TabButton: View {
    var image: String
    var title: String
    @Binding var selected: String
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) { selected = title }
        }, label: {
            HStack(spacing: 16) {
                Image(systemName: image)
                    .font(.system(size: 16))
                    .foregroundColor(selected == title ? Color("gradient1") : Color.gray)
                    .frame(width: 30)
                
                Text(title)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                Spacer(minLength: 0)
                
                // CURRENT TAB INDICATOR
                ZStack {
                    Capsule()
                        .fill(Color.clear)
                        .matchedGeometryEffect(id: "Tab", in: animation)
                    
                    if selected == title {
                        Capsule()
                            .fill(Color("gradient1"))
                            .matchedGeometryEffect(id: "Tab", in: animation)
                    }
                }
                .frame(width: 2, height: 24)
            }
            .padding(.leading)
            .padding(.top, 5)
            .contentShape(Rectangle())
        })
        .buttonStyle(PlainButtonStyle())
    }
}
