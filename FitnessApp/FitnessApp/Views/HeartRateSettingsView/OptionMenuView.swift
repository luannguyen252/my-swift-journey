//
//  OptionMenuView.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct OptionMenuView: View {
    // MARK: - PROPERTIES
    let menu: Models.HeartRateMenu
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 4) {
            Text(menu.name)
                .foregroundColor(menu.selected ? Color.white: ColorConstants.textCircleSecendary)
            
            Rectangle()
                .fill(ColorConstants.selectedColor)
                .frame(width: 40, height: 2)
                .shadow(color: ColorConstants.selectedColor, radius: 8)
                .opacity(menu.selected ? 1.0 : 0.0)
        } //: VSTACK
    }
}
