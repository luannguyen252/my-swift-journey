//
//  SideMenuView.swift
//  SlideIn
//
//  Created by Sud on 6/23/19.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import SwiftUI


struct SideMenuView : View {
    @Binding var selectedColor: Color
    @Binding var showSideMenu: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Pick a Shade")
                    .font(.largeTitle)
                    .padding(30)
                Spacer()
            }
            ForEach(colorPalette, id: \.self) { colorRow in
                ColorRowView(colors: colorRow, selectedColor: self.$selectedColor, showSideMenu: self.$showSideMenu)
                .padding(10)
            }
        }
    }
}

struct ColorRowView : View {
    let colors: [Color]
    @Binding var selectedColor: Color
    @Binding var showSideMenu: Bool
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Spacer()
            HStack(spacing: 10.0) {
                Spacer()
                ForEach(colors, id: \.self) { color in
                    Button(action: {
                        self.selectedColor = color
                        self.showSideMenu = false
                    }) {
                        if self.selectedColor == color {
                            ZStack {
                                Circle()
                                    .fill(color)
                                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                    .overlay(Circle().stroke(color, lineWidth: 1))
                                Image(systemName: "checkmark")
                                    .foregroundColor(Color.white)
                            }
                        }
                        else {
                            Circle().fill(color)
                        }
                    }
                    .frame(width: 60, height: 60)
                }
                Spacer()
            }
            Spacer()
        }
    }
}
