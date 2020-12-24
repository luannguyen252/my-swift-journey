//
//  WaveView.swift
//  CaloryApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct WaveView: View {
    // MARK: - BODY
    var body: some View {
        ZStack {
            Wave(graphWidth: 0.4, amplitude: 0.1).fill(ColorConstants.todayViewGradientColor)
            Wave(graphWidth: 0.4, amplitude: 0.1)
                .offset(x: 40)
                .opacity(0.1)
        } //: ZSTACK
        .background(Color.white)
        .cornerRadius(97)
        .foregroundColor(ColorConstants.endColor)
    }
}
