//
//  FanSpeedView.swift
//  SmartHomeTemperatureWheel
//
//  Created by Anik on 26/9/20.
//

import SwiftUI

struct FanSpeedView: View {
    @State var sliderValue: Double = 4
    var body: some View {
        HStack {
            Image(systemName: "bonjour")
                .foregroundColor(.gray)
            Slider(value: $sliderValue, in: 0...10)
                .accentColor(.red)
        }
    }
}
