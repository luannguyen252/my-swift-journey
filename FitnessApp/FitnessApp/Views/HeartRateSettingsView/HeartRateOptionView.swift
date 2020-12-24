//
//  HeartRateOptionView.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct HeartRateOptionView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var manager: HeartRateManager
    
    // MARK: - BODY
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.clear)
                    .invertedRectangleNeomorphify(
                        topBlur: 6,
                        bottomBlur: 8,
                        cornerRadius: 40)
                    .frame(width: 170, height: 170)
                    .padding(.top, 16)
                
                VStack {
                    Text("\(manager.menus[manager.lastSelectedMenuIndex].currentValue)")
                        .font(.system(size: 50))
                        .bold()
                        .foregroundColor(.white)
                    
                    Text("bpm")
                        .foregroundColor(ColorConstants.textCircleSecendary)
                } //: VSTACK
            } //: ZSTACK
            
            HStack(spacing: 30) {
                ForEach(manager.menus) { menu in
                    OptionMenuView(menu: menu)
                        .onTapGesture{
                            manager.selectMenu(index: menu.id)
                        }
                }
            } //: HSTACK
            .onAppear {
                manager.selectMenu(index: 1)
            }
        } //: VSTACK
    }
}
