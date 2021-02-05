#if !os(macOS)
import SwiftUI
import ComposableArchitecture
import RenaudJennyAboutView

struct MainView: View {
    let store: Store<AppState, AppAction>
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    @State private var isConfigurationNavigationActive = false
    @State private var isAboutNavigationActive = false
    @State private var isHighScoresNavigationActive = false

    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                stackOrScroll {
                    Text("Moves: \(viewStore.game.moves)")
                        .font(.title)
                        .animation(nil)
                    GameOverView(store: store.gameStore)
                    adaptiveGrid(level: viewStore.game.level) {
                        ForEach(viewStore.game.cards) {
                            GameCardView(store: store.gameStore, card: $0)
                        }
                    }
                    .padding()
                }
                .toolbar(content: toolbar)
                .background(navigation(highScorePreselectedLevel: viewStore.game.level))
            }
            .sheet(
                isPresented: viewStore.binding(
                    get: { $0.isNewHighScoreEntryPresented },
                    send: .newHighScoreEntered
                ),
                content: { NewHighScoreView(store: store) }
            )
            .modifier(SetupNewGameAlert(store: store.gameStore))
            .modifier(SetupDifficultyLevelChangedAlert(store: store))
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }

    private func gridItems(level: DifficultyLevel) -> [GridItem] {
        let gridItemPattern = GridItem(.flexible(minimum: 50, maximum: 150))
        switch (horizontalSizeClass, verticalSizeClass, level) {
        case (.compact, .regular, _):
            // 4x4, 4x5, 4x6 Grid
            return Array(repeating: gridItemPattern, count: 4)
        case (_, .compact, .easy):
            // 4x4 Grid
            return Array(repeating: gridItemPattern, count: 4)
        case (_, .compact, .normal):
            // 5x4 Grid
            return Array(repeating: gridItemPattern, count: 5)
        case (_, .compact, .hard):
            // 6x4 Grid
            return Array(repeating: gridItemPattern, count: 6)
        case (.regular, .regular, _):
            // 4x4, 4x5, 4x6 Grid, bigger images
            return Array(repeating: gridItemPattern, count: 4)
        default:
            return [GridItem(.adaptive(minimum: 100))]
        }
    }

    @ViewBuilder
    private func adaptiveGrid<Content: View>(level: DifficultyLevel, @ViewBuilder content: () -> Content) -> some View {
        switch (horizontalSizeClass, verticalSizeClass) {
        case (.regular, .regular): LazyHGrid(rows: gridItems(level: level)) { content() }
        default: LazyVGrid(columns: gridItems(level: level)) { content() }
        }
    }

    @ViewBuilder
    private func stackOrScroll<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        switch (horizontalSizeClass, verticalSizeClass) {
        case (.regular, .regular): VStack { content() }
        default: ReversedScrollView { content() }
        }
    }

    private func toolbar() -> some ToolbarContent {
        Group {
            ToolbarItem(placement: .principal) {
                Text("MemoArt")
            }

            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button {
                    isAboutNavigationActive = true
                } label: {
                    Image(systemName: "questionmark.circle")
                }
                .accessibilityLabel(Text("About"))
                .accessibilityIdentifier("about")

                Button {
                    isConfigurationNavigationActive = true
                } label: {
                    Image(systemName: "gearshape")
                }
                .accessibilityLabel(Text("Configuration"))
                .accessibilityIdentifier("configuration")
            }

            ToolbarItemGroup(placement: .navigationBarTrailing) {
                NewGameButton(store: store.gameStore)
                Button {
                    isHighScoresNavigationActive = true
                } label: {
                    Text("🏆")
                }
                .accessibility(label: Text("High Scores"))
                .accessibility(identifier: "high_scores")
            }
        }
    }

    private func navigation(highScorePreselectedLevel: DifficultyLevel) -> some View {
        VStack {
            NavigationLink(
                destination: ConfigurationView(store: store.configurationStore),
                isActive: $isConfigurationNavigationActive,
                label: EmptyView.init
            )
            NavigationLink(
                destination: aboutView,
                isActive: $isAboutNavigationActive,
                label: EmptyView.init
            )
            NavigationLink(
                destination: HighScoresView(store: store.highScoresStore, preselectedLevel: highScorePreselectedLevel),
                isActive: $isHighScoresNavigationActive,
                label: EmptyView.init
            )
        }
    }

    private var aboutView: some View {
        AboutView(
            appId: "id1536330844",
            logo: {
                Image("Pixel Art")
                    .resizable()
                    .modifier(AddCardStyle(foregroundColor: .red))
                    .frame(width: 120, height: 120)

            }
        )
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(store: Store<AppState, AppAction>(
            initialState: AppState(),
            reducer: appReducer,
            environment: .preview
        ))
    }
}

struct ContentViewGameOver_Previews: PreviewProvider {
    static var previews: some View {
        MainView(store: Store<AppState, AppAction>(
            initialState: .mocked {
                $0.game.isGameOver = true
                $0.game.discoveredArts = Art.allCases
                $0.game.moves = 42
                $0.game.cards = .predicted(isFaceUp: true)
            },
            reducer: appReducer,
            environment: .preview
        ))
    }
}

struct ContentViewAlmostFinished_Previews: PreviewProvider {
    static var previews: some View {
        MainView(store: Store(
            initialState: .almostFinishedGame,
            reducer: appReducer,
            environment: .preview
        ))
    }
}
#endif
#endif
