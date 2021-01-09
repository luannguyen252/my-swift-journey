//
//  AnyTransition+FadeOut.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/20/20.
// ✌️
//

import Foundation
import SwiftUI

extension AnyTransition {
    static var fadeOut: AnyTransition {
        AnyTransition.modifier(
            active: CustomOpacityModifier(opacity: 1),
            identity: CustomOpacityModifier(opacity: 0)
        )
    }
}

// MARK: - ViewModifier for Transition
struct CustomOpacityModifier {
    var opacity: Double
}

extension CustomOpacityModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.opacity(opacity)
    }
}
