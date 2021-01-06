/*
See LICENSE folder for this sample’s licensing information.

Abstract:
One side of a flash card, containing some content and a background image.
*/

import SwiftUI

extension FlashCard {
    struct Side<Content: View> : View {
        let content: Content

        // A custom View Builder lets a caller use the view builder syntax when creating a Side.
        init(@ViewBuilder content: () -> Content) {
            self.content = content()
        }

        var body: some View {
            ZStack {
                Image(decorative: "CardBackground")
                    .resizable(capInsets:
                        .init(top: 5.0, leading: 5.0, bottom: 5.0, trailing: 5.0)
                )
                content
                    .padding()
            }
            .aspectRatio(4.0 / 2.8, contentMode: .fit)
            .font(Font.system(size: 40.0, design: .rounded))
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
            .lineLimit(3)
            .minimumScaleFactor(0.5)
            .frame(height: 120.0)
        }
    }
}

struct CardSide_Previews: PreviewProvider {
    static var previews: some View {
        FlashCard.Side {
            Text("Side")
        }
    }
}
