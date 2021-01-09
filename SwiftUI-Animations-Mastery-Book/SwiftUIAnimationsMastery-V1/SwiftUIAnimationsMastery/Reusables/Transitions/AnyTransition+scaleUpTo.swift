//
//  AnyTransition+scaleUpTo.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/20/20.
// ✌️
//

import Foundation
import SwiftUI

extension AnyTransition {
    static func scaleUp(to scale: CGFloat) -> AnyTransition {
        AnyTransition.modifier(
            active: CustomScaleModifier(scale: 1.0),
            identity: CustomScaleModifier(scale: scale)
        )
    }
}

// MARK: - ViewModifier for Transition
struct CustomScaleModifier {
    var scale: CGFloat
}

extension CustomScaleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.scaleEffect(scale)
    }
}
