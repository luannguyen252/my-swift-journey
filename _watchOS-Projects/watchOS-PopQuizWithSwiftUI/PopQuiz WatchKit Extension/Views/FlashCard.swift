/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A flash card view consisting of two sides and a flip rotation.
*/

import SwiftUI

struct FlashCard: View {
    let card: Card

    /*
     The flash card consists of two Sides, and a Flip View that applies custom
     gestures and animations.
     */
    var body: some View {
        FlipView(
            Side {
                Text(card.question)
            },
            Side {
                Text(card.answer)
            }
        )
    }
}

struct FlashCard_Previews: PreviewProvider {
    static var previews: some View {
        FlashCard(card: Card.previewCard)
    }
}
