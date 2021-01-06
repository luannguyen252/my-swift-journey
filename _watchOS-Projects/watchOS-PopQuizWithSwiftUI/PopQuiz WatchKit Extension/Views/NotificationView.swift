/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The view shown in PopQuiz's interactive user notification.
*/

import SwiftUI

struct NotificationView: View {
    let card: Card

    /*
     The NotificationView uses the same FlashCard as the CardList to show a
     flash card in an interactive notification.
     */
    var body: some View {
        VStack {
            Text("What's the answer?")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Divider()
            FlashCard(card: card)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(card: Card.previewCard)
    }
}
