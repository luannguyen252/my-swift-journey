import SwiftUI
import ComposableArchitecture

struct NewHighScoreView: View {
    let store: Store<AppState, AppAction>
    @State private var name = ""

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Spacer()
                VictoryCardsView()
                TextField("Your name", text: $name, onCommit: {
                    submit(with: viewStore)
                })
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: { submit(with: viewStore) }, label: {
                    Text("Add my new high score")
                })
                Spacer()
            }
            .background(
                Image("Motif")
                    .resizable(resizingMode: .tile)
                    .renderingMode(.template)
                    .opacity(1/10)
            )
        }
    }

    private func submit(with viewStore: ViewStore<AppState, AppAction>) {
        if name == "" {
            viewStore.send(.highScores(.addScore(
                HighScore(score: viewStore.game.moves, date: Date()),
                viewStore.game.level
            )))
        } else {
            viewStore.send(.highScores(.addScore(
                HighScore(score: viewStore.game.moves, name: name, date: Date()),
                viewStore.game.level
            )))
        }
        viewStore.send(.newHighScoreEntered)
    }
}

#if DEBUG
struct NewHighScoreView_Previews: PreviewProvider {
    static var previews: some View {
        NewHighScoreView(store: Store<AppState, AppAction>(
            initialState: AppState(
                game: GameState(
                    moves: 42,
                    cards: [],
                    discoveredArts: [],
                    isGameOver: true
                ),
                highScores: .preview,
                isNewHighScoreEntryPresented: true
            ),
            reducer: appReducer,
            environment: .preview
        ))
    }
}
#endif
