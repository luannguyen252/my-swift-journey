//
//  FanSpeedView.swift
//  SwiftUIAirConditionerController
//
//  Created by Luan Nguyen on 26/12/2020.
//

import SwiftUI

struct FanSpeedView: View {
    @State var sliderValue: Double = 5
    
    var body: some View {
        HStack {
            Image(systemName: "wind")
                .font(.title3)
                .foregroundColor(.gray)
            
            Slider(value: $sliderValue, in: 0...10)
                .accentColor(.red)
        }
    }
}
