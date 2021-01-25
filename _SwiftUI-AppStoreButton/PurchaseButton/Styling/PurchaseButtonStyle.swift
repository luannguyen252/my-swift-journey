//
//  PayButtonStyle.swift
//  PurchaseButton
//
//  Created by Pablo Blanco González on 08/10/2020.
//

import SwiftUI

struct PurchaseButtonStyle: ButtonStyle {
    
    var state: PurchaseButtonState
    
    func makeBody(configuration: Configuration) -> some View {
        let properties = state.properties
        return configuration.label
            .padding(.vertical, properties.verticalPadding)
            .padding(.horizontal, properties.horizontalPadding)
            .foregroundColor(properties.foregroundColor)
            .background(properties.backgroundColor)
            .cornerRadius(properties.cornerRadius)
            .font(properties.font)
            .scaleEffect(properties.isEnabled && configuration.isPressed ? 0.95 : 1)
    }
}
