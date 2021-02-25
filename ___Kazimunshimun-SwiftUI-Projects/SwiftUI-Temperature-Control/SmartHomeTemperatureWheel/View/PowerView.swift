//
//  PowerView.swift
//  SmartHomeTemperatureWheel
//
//  Created by Anik on 26/9/20.
//

import SwiftUI

struct PowerView: View {
    var body: some View {
        HStack {
            Image(systemName: "power")
                .font(.system(size: 24, weight: .black))
                .foregroundColor(.red)
            Text("Hold to turn off")
                .font(.system(size: 12, weight: .semibold, design: .monospaced))
                .foregroundColor(.gray)
        }
    }
}
