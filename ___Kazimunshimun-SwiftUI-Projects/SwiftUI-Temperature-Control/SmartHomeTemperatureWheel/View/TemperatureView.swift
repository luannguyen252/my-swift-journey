//
//  TemperatureView.swift
//  SmartHomeTemperatureWheel
//
//  Created by Anik on 26/9/20.
//

import SwiftUI

struct TemperatureView: View {
    @Binding var temperature: Int
    var body: some View {
        VStack(alignment: .leading) {
            Text("Temperature,℉")
                .font(.system(size: 20, weight: .black, design: .monospaced))
            Text("\(temperature)")
                .font(.system(size: 80, weight: .black, design: .monospaced))
        }
    }
}
