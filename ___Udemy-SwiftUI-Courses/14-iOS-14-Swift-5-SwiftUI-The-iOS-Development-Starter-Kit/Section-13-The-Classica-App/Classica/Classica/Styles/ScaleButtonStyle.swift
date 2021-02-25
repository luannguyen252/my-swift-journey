//
//  ScaleButtonStyle.swift
//  Classica
//
//  Created by Pao Yu on 2020-08-05.
//

import SwiftUI

struct ScaleButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
    }
    
}
