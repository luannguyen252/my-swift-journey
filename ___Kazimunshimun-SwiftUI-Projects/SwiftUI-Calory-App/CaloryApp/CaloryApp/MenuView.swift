//
//  MenuView.swift
//  CaloryApp
//
//  Created by Anik on 29/6/20.
//  Copyright © 2020 a7studio. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    let width: CGFloat
    @ObservedObject var menuViewModel: MenuViewModel
    
    var body: some View {
        VStack() {
            ZStack(alignment: .bottom) {
                Rectangle()
                    .frame(width: width - 60, height: 90)
                    .foregroundColor(.clear)
                RoundedRectangle(cornerRadius: 33)
                    .frame(width: width - 60,height: 65)
                    .foregroundColor(.white)
                
                HStack {
                    Spacer()
                    Menu(menuItem: self.menuViewModel.menus[0]).onTapGesture {
                        withAnimation(.linear(duration: 0.8)) {
                            self.menuViewModel.selectMenu(index: 0)
                        }
                    }
                    Spacer()
                    Menu(menuItem: self.menuViewModel.menus[1]).onTapGesture {
                        withAnimation(.linear(duration: 0.8)) {
                            self.menuViewModel.selectMenu(index: 1)
                        }
                    }
                    Spacer()
                    Menu(menuItem: self.menuViewModel.menus[2]).onTapGesture {
                        withAnimation(.linear(duration: 0.8)) {
                            self.menuViewModel.selectMenu(index: 2)
                        }
                    }
                    Spacer()
                }
            }
        }
        
    }
}

struct Menu: View {
    let menuItem: MenuItem
    var body: some View {
        ZStack {
            if (menuItem.isSelected) {
                Group {
                    Circle().foregroundColor(ColorConstants.appBackgroundColor).frame(width: 70, height: 70)
                    Circle().fill(ColorConstants.todayViewGradientColor).frame(width: 60, height: 60)
                }.transition(.scale)
            }
            Image(menuItem.imageName)
                .renderingMode(.template)
                .frame(width: 70, height: 70)
                .foregroundColor(menuItem.isSelected ? .white : ColorConstants.lightGrayColor)
                
        }.offset(x: 0, y : menuItem.isSelected ? -15 : 0)
            .transition(.slide)
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(width: 375, menuViewModel: MenuViewModel())
    }
}
