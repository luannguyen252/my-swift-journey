/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The list of flash cards for a particular topic.
*/

import SwiftUI

struct CardList: View {
    let topic: Topic
    @State var currentIndex = 0.0

    var body: some View {
        VStack {
            Text("Ready? Let's review!")
                .multilineTextAlignment(.center)
                .font(.headline)
            Divider()
            ZStack {
                ForEach((0..<self.topic.cards.count).reversed()) { index in
                    // Apply the card transformation modifier to each card.
                    FlashCard(card: self.topic.cards[index])
                        .cardTransformed(self.currentIndex, card: index)
                }
            }
            /*
             The focusable and digital crown rotation modifiers allow for
             scrolling through each card with the Digital Crown.
             */
            .focusable(true)
            .digitalCrownRotation(
                $currentIndex.animation(),
                from: 0.0,
                through: Double(topic.cards.count - 1),
                by: 1.0,
                sensitivity: .low
            )
        }
        .navigationBarTitle(Text(topic.title))
    }
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList(topic: Topic.previewTopic)
    }
}
