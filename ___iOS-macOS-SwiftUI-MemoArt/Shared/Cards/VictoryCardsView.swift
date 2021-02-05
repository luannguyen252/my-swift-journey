import SwiftUI
import Combine

struct VictoryCardsView: View {
    @State private var isCardsFacedUp = Array(repeating: Bool.random(), count: 5)
    @State private var colors: [Color] = [.green, .blue, .red, .blue, .green]
    @State private var images: [Image] = Art.allCases.shuffled().prefix(5).map(\.image)
    @State private var returnCardTask: Cancellable?

    var body: some View {
        HStack {
            Spacer()
            ZStack {
                ForEach(0..<5) { cardNumber in
                    CardView(
                        color: colors[cardNumber],
                        image: images[cardNumber],
                        isFacedUp: isCardsFacedUp[cardNumber],
                        accessibilityIdentifier: "card number \(cardNumber)",
                        accessibilityFaceDownText: Text(
                            "Card in animation faced down",
                            comment: "Card for Victory animation description (for screen reader)"
                        ),
                        accessibilityFaceUpText: Text(
                            "Card in animation faced up",
                            comment: "Card for Victory animation description (for screen reader)"
                        )
                    )
                    .frame(width: 80, height: 80)
                    .rotationEffect(angle(cardNumber: cardNumber))
                    .offset(offset(cardNumber: cardNumber))
                }
                .padding(.vertical, 50)
                .padding(.horizontal, 115)
            }
            Spacer()
        }
        .onAppear(perform: startVictoryAnimation)
        .onDisappear(perform: returnCardTask?.cancel)
    }

    private func angle(cardNumber: Int) -> Angle {
        .radians(-.pi/16 * 4 + 2 * .pi/16 * Double(cardNumber))
    }

    private func offset(cardNumber: Int) -> CGSize {
        CGSize(
            width: -24 * 4 + 2 * 24 * cardNumber,
            height: 7 * (cardNumber * cardNumber) - 28 * cardNumber
        )
    }

    private var randomColor: Color {
        [Color.green, Color.blue, Color.red].randomElement() ?? .red
    }

    private var randomArt: Image {
        Art.allCases.randomElement()?.image ?? Art.artDeco.image
    }

    private func startVictoryAnimation() {
        returnCardTask = Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .sink { _ in
                isCardsFacedUp = [Bool.random(), Bool.random(), Bool.random(), Bool.random(), Bool.random()]
                colors = isCardsFacedUp.enumerated().map { offset, isFacedUp in
                    if isFacedUp { return [.green, .blue, .red].randomElement() ?? .red }
                    return colors[offset]
                }
                images = isCardsFacedUp.enumerated().map { offset, isFacedUp in
                    if isFacedUp { return images[offset] }
                    return Art.allCases.randomElement()?.image ?? Art.artDeco.image
                }
            }
    }
}

#if DEBUG
struct VictoryCardsView_Previews: PreviewProvider {
    static var previews: some View {
        VictoryCardsView()
    }
}
#endif
