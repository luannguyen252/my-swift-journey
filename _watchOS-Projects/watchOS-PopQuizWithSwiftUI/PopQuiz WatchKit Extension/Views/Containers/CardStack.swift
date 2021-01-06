/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A custom view modifier which applies a card-like 3D rotation effect.
*/

import SwiftUI

struct CardModifier: ViewModifier {
    let rotation: Angle
    let zRotation: Angle
    let opacity: Double
    let allowInteraction: Bool

    init(
        rotation: Angle = .degrees(0.0),
        zRotation: Angle = .degrees(0.0),
        opacity: Double = 1.0,
        allowInteraction: Bool = false
    ) {
        self.rotation = rotation
        self.zRotation = zRotation
        self.opacity = opacity
        self.allowInteraction = allowInteraction
    }

    func body(content: Content) -> some View {
        content
            .rotationEffect(rotation)
            .rotation3DEffect(
                zRotation,
                axis: (1.0, 0.0, 0.0),
                anchor: .init(x: 0.5, y: 1.1),
                perspective: 0.1
            )
            .opacity(opacity)
            .allowsHitTesting(allowInteraction)
    }

    static func modifier(offset: Int) -> CardModifier {
        switch offset {
        // Current interactive card.
        case 0:
            return .init(allowInteraction: true)
        // The card right in front.
        case 1:
            return .init(zRotation: .degrees(-90.0), opacity: 1.0)
        // The card right behind.
        case -1:
            return .init(rotation: .degrees(-2.0))
        case -2:
            return .init(rotation: .degrees(3.0))
        case -3:
            return .init(rotation: .degrees(-1))
        default:
            break
        }

        if offset > 1 {
            return .init(zRotation: .degrees(-90.0), opacity: 0.0)
        } else {
            return .init(zRotation: .degrees(1.0), opacity: 0.0)
        }
    }
}

extension View {

    /// A view modifier which applies a custom 3D "card flip" transformation to the view.
    /// - Parameter stackOffset: The current offset into the stack.
    /// - Parameter card: The index of the card to be flipped.
    func cardTransformed(_ stackOffset: Double, card: Int) -> ModifiedContent<Self, CardModifier> {
        self.modifier(CardModifier.modifier(offset: Int(stackOffset.rounded()) - card))
    }
}
