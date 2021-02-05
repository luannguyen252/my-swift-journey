import SwiftUI
import ComposableArchitecture

struct GameCardView: View {
    let store: Store<GameState, GameAction>
    let card: Card
    private static let turnCardAnimationDuration: Double = 2/5

    var body: some View {
        WithViewStore(store) { viewStore in
            CardView(
                color: .forLevel(viewStore.level),
                image: card.art.image,
                isFacedUp: card.isFaceUp,
                accessibilityIdentifier: "card number \(card.id)",
                accessibilityFaceDownText: Text(
                    "Card number \(card.id)",
                    comment: "The Card number when the card is faced down for the game (for screen reader)"
                ),
                accessibilityFaceUpText: Text(
                    "Card with the style \(card.art.description)",
                    comment: "The Card image description (for screen reader)"
                ),
                action: { returnCard(store: viewStore) }
            )
        }
    }

    private func returnCard(store: ViewStore<GameState, GameAction>) {
        withAnimation(.spring()) { store.send(.cardReturned(card.id)) }
    }
}

#if DEBUG
struct GameCardView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }

    private struct Preview: View {
        let store = Store<GameState, GameAction>(
            initialState: .preview,
            reducer: gameReducer,
            environment: .preview
        )

        var body: some View {
            WithViewStore(store) { viewStore in
                VStack {
                    Spacer()
                    VStack {
                        HStack {
                            GameCardView(store: store, card: card(store: viewStore, id: 0))
                            GameCardView(store: store, card: card(store: viewStore, id: 1))
                        }
                        HStack {
                            GameCardView(store: store, card: card(store: viewStore, id: 2))
                            GameCardView(store: store, card: card(store: viewStore, id: 3))
                        }
                        HStack {
                            GameCardView(store: store, card: card(store: viewStore, id: 4))
                            GameCardView(store: store, card: card(store: viewStore, id: 5))
                        }
                    }
                    Spacer()
                    Button(action: { viewStore.send(.new) }, label: {
                        Text("New game")
                    })
                    .padding()
                }.padding()
            }
        }

        private func card(store: ViewStore<GameState, GameAction>, id: Int) -> Card {
            store.cards[id]
        }
    }
}
#endif
