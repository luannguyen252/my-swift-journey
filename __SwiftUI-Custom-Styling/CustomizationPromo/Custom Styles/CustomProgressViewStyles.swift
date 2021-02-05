//
//  CustomProgressViewStyles.swift
//
//  Created by Stewart Lynch on 2020-10-28.
//

import SwiftUI

struct BatteryViewStyle: ProgressViewStyle {
    var width: CGFloat = 250
    var height: CGFloat = 50
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.label
                .foregroundColor(Color.green)
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.green)
                .frame(width: width, height: height)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [.black, .green]), startPoint: .leading, endPoint: .trailing)
                        )
                        .frame(width: width * CGFloat(configuration.fractionCompleted!)),
                    alignment: .leading
                )
            configuration.currentValueLabel
        }
    }
}
