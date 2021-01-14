//
//  CustomToggleStyle.swift
//  Cybertruck
//
//  Created by Anik on 31/8/20.
//

import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    var diameter: CGFloat
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .fill(configuration.isOn ?
                        Color.blueButtonBackground :
                        Color.buttonSelectedReverseBackground)
                .overlay(
                    Circle()
                        .stroke(configuration.isOn ?
                                    Color.blueButtonBorder :
                                    Color.buttonSelectedBackground,
                                lineWidth: 4)
                )
                .shadow(color: .black, radius: diameter == 140 ? 40 : 20, x: 10, y: 15)
                .shadow(color: .darkStart, radius: diameter == 140 ? 40 : 20, x: -10, y: -15)
                .frame(width: diameter, height: diameter)
            
            configuration.label
                .foregroundColor(configuration.isOn ? .white : .gray)
        }
        .onTapGesture {
            configuration.isOn.toggle()
        }
    }
}
