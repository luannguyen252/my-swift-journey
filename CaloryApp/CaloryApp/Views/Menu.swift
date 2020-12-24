//
//  Menu.swift
//  CaloryApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct Menu: View {
    // MARK: - PROPERTIES
    let menuItem: MenuItem
    
    // MARK: - BODY
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
                
        } //: ZSTACK
        .offset(x: 0, y : menuItem.isSelected ? -15 : 0)
        .transition(.slide)
    }
}
