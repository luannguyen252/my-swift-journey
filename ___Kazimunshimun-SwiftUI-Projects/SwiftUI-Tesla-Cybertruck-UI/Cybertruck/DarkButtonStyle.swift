//
//  DarkButtonStyle.swift
//  Cybertruck
//
//  Created by Anik on 31/8/20.
//

import SwiftUI

struct DarkButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.buttonTintColor)
            .padding(22)
            .contentShape(Circle())
            .background(DarkButtonBackground(shape: Circle(), isHighlighted: configuration.isPressed))
    }
}

struct DarkButtonBackground<S: Shape>: View {
    var shape: S
    var isHighlighted: Bool
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(Color.darkStart)
                    .shadow(color: .darkShadow, radius: 10, x: 7, y: 7)
                    .shadow(color: .lightShadow, radius: 10, x: -7, y: -7)
            } else {
                shape
                    .fill(Color.buttonBackground)
                    .shadow(color: .darkShadow, radius: 10, x: 7, y: 7)
                    .shadow(color: .lightShadow, radius: 10, x: -7, y: -7)
            }
        }
    }
}
