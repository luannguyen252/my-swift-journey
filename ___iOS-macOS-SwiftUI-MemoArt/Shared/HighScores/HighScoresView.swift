import SwiftUI
import ComposableArchitecture

struct HighScoresView: View {
    let store: Store<HighScoresState, HighScoresAction>
    @State private var level: DifficultyLevel

    init(store: Store<HighScoresState, HighScoresAction>, preselectedLevel: DifficultyLevel) {
        self.store = store
        self._level = State(initialValue: preselectedLevel)
    }

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                DifficultyLevelPicker(level: $level).padding([.horizontal, .bottom])

                ScrollView {
                    if displayedHighScores(store: viewStore).count <= 0 {
                        Text("Go win some game to see your best scores here ⭐️")
                            .bold()
                            .padding(.top, 64)
                            .padding()
                    } else {
                        VStack(spacing: 0) {
                            ForEach(enumeratedHighScores(store: viewStore), id: \.0) { position, score in
                                HighScoreView(position: position, highScore: score)
                            }
                        }
                    }
                }
                .navigationTitle("High Scores 🏆")
            }
        }
    }

    private func displayedHighScores(store: ViewStore<HighScoresState, HighScoresAction>) -> [HighScore] {
        store.boards.highScores(level: level)
    }

    private func enumeratedHighScores(
        store: ViewStore<HighScoresState, HighScoresAction>
    ) -> [(offset: Int, element: HighScore)] {
        Array(displayedHighScores(store: store).enumerated())
    }
}

struct HighScoreView: View {
    let position: Int
    let highScore: HighScore
    private static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()

    var body: some View {
        HStack {
            positionView
                .modifier(AddCardStyle(foregroundColor: .red))
                .frame(width: 50)
            Text("\(highScore.score)")
                .font(.title3)
                .frame(width: 40)
            Text(highScore.name)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(highScore.date, formatter: Self.dateFormat)
                .font(.caption)
                .frame(width: 120, alignment: .trailing)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(
            position.isMultiple(of: 2)
                ? Color.systemBackground
                : Color.systemGray5
        )
    }

    private var positionView: some View {
        Group {
            switch position {
            case 0: Text("🥇")
                .font(.title)
                .accessibility(label: Text("First"))
            case 1: Text("🥈")
                .font(.title)
                .accessibility(label: Text("Second"))
            case 2: Text("🥉")
                .font(.title)
                .accessibility(label: Text("Third"))
            default: Text("\(position + 1)")
                .bold()
                .font(.title2)
                .accessibilityLabel("Position: \(position)")
            }
        }
        .foregroundColor(.yellow)
    }
}

#if DEBUG
struct HighScoresView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HighScoresView(
                store: .init(
                    initialState: .preview,
                    reducer: highScoresReducer,
                    environment: .preview
                ),
                preselectedLevel: .normal
            )
        }
    }
}

struct HighScoresViewEmptyScores_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HighScoresView(
                store: .init(
                    initialState: HighScoresState(),
                    reducer: highScoresReducer,
                    environment: .preview
                ),
                preselectedLevel: .normal
            )
        }
    }
}

extension Date {
    static let preview = Date(timeIntervalSince1970: 12345)
}
#endif
