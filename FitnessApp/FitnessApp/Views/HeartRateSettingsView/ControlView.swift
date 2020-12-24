//
//  ControlView.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ControlView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var manager: HeartRateManager
    
    // MARK: - BODY
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(ColorConstants.hexagonLinearInverted)
                    .frame(width: 50, height: 50)
                
                Text("i")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
            } //: ZSTACK
            
            VerticalSlider(bpm: $manager.menus[manager.lastSelectedMenuIndex].currentValue)
        } //: VSTACK
    }
}
