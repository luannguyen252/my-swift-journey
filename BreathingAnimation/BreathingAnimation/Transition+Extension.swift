//
//  Transition+Extension.swift
//  BreathingAnimation
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

// MARK: - TRANSITION
extension AnyTransition {
    static var blurFade: AnyTransition {
        get {
            AnyTransition.modifier(
                active: BlurFadeModifier(isActive: true),
                identity: BlurFadeModifier(isActive: false)
            )
        }
    }
}

// MARK: - BLUR FADE
struct BlurFadeModifier: ViewModifier {
    let isActive: Bool

    func body(content: Content) -> some View {
        content
            .scaleEffect(isActive ? 1.5 : 1) // Lagging behind effect
            .blur(radius: isActive ? 8 : 0)
            .opacity(isActive ? 0 : 0.7)
    }
}
