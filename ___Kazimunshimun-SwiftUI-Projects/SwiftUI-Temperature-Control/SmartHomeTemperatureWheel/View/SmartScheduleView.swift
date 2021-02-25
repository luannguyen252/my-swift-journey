//
//  SmartScheduleView.swift
//  SmartHomeTemperatureWheel
//
//  Created by Anik on 26/9/20.
//

import SwiftUI

struct SmartScheduleView: View {
    var body: some View {
        HStack {
            Image(systemName: "stopwatch")
                .foregroundColor(.gray)
            Text("Set smart schedule")
                .font(.system(size: 14, weight: .bold, design: .monospaced))
                .foregroundColor(.red)
        }
    }
}
