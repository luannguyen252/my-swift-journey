import SwiftUI
import ComposableArchitecture

struct GameOverView: View {
    let store: Store<GameState, GameAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            if viewStore.isGameOver {
                VStack {
                    Text("⭐️ Bravo ⭐️").font(.largeTitle)
                    Button(action: { withAnimation(.spring()) { viewStore.send(.new) } }, label: {
                        Text("New game")
                    })
                }
                .padding(.top)
                .transition(
                    .asymmetric(insertion: .slide, removal: .opacity)
                )
            }
        }
    }
}
