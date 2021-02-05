import SwiftUI
import ComposableArchitecture
import RenaudJennyAboutView

struct ContentView: View {
    let store: Store<AppState, AppAction>
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass

    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                stackOrScroll {
                    gameOverView
                    LazyVGrid(columns: columns) {
                        ForEach(0..<20) {
                            CardView(store: store.scope(state: { $0.game }, action: AppAction.game), id: $0)
                        }
                    }
                    .padding()
                }
                .onAppear(perform: { viewStore.send(.highScores(.load)) })
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text("MemoArt").font(.headline)
                            Text("Moves: \(viewStore.game.moves)").font(.subheadline)
                        }
                    }
                    ToolbarItem(placement: Self.navigationBarLeadingPlacement) {
                        HStack {
                            aboutNavigationLink
                            configurationLink.padding(.leading)
                        }
                    }
                    ToolbarItem(placement: Self.navigationBarTrailingPlacement) {
                        highScoresNavigationLink
                    }
                }
            }
            .sheet(
                isPresented: viewStore.binding(
                    get: { $0.isNewHighScoreEntryPresented },
                    send: .newHighScoreEntered
                ),
                content: { NewHighScoreView(store: store) }
            )
            .navigationViewStyle(Self.navigationViewStyle)
        }
    }

    var columns: [GridItem] {
        let gridItemPattern = GridItem(.flexible(minimum: 50, maximum: 125))
        switch (horizontalSizeClass, verticalSizeClass) {
        case (.compact, .regular):
            // 4x5 Grid
            return Array(repeating: gridItemPattern, count: 4)
        case (.compact, .compact):
            // 7x3 Grid
            return Array(repeating: gridItemPattern, count: 7)
        case (.regular, .regular):
            // 5x4 Grid, bigger images
            return Array(repeating: gridItemPattern, count: 5)
        default:
            return [GridItem(.adaptive(minimum: 100))]
        }
    }

    private var aboutNavigationLink: some View {
        NavigationLink(
            destination: AboutView(
                appId: "id1536330844",
                logo: {
                    Image("Pixel Art")
                        .resizable()
                        .modifier(AddCardStyle())
                        .frame(width: 120, height: 120)

                }),
            label: {
                Image(systemName: "questionmark.circle")
            }
        )
    }

    private var configurationLink: some View {
        NavigationLink(
            destination: SymbolTypesSelectionConfigurationView(
                store: store.scope(state: { $0.configuration }, action: AppAction.configuration)
            ),
            label: {
                Image(systemName: "gearshape")
            }
        )
    }

    private var highScoresNavigationLink: some View {
        NavigationLink(
            destination: HighScoresView(store: store.scope(
                state: { $0.highScores },
                action: AppAction.highScores
            )),
            label: {
                Text("🏆")
            }
        )
        .accessibility(label: Text("High Scores"))
    }

    private var gameOverView: some View {
        WithViewStore(store) { viewStore in
            if viewStore.game.isGameOver {
                VStack {
                    Text("⭐️ Bravo ⭐️").font(.largeTitle)
                    Button(action: { withAnimation(.spring()) { viewStore.send(.game(.new)) } }, label: {
                        Text("New Game")
                    })
                }
                .padding(.top)
                .transition(
                    .asymmetric(insertion: .slide, removal: .opacity)
                )
            }
        }
    }

    @ViewBuilder
    private func stackOrScroll<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        switch (horizontalSizeClass, verticalSizeClass) {
        case (.regular, .regular): VStack { content() }
        default: ReversedScrollView { content() }
        }
    }
}

extension ContentView {
    #if !os(macOS)
    private static let navigationViewStyle = StackNavigationViewStyle()
    #else
    private static let navigationViewStyle = DefaultNavigationViewStyle()
    #endif

    #if !os(macOS)
    private static let navigationBarLeadingPlacement = ToolbarItemPlacement.navigationBarLeading
    #else
    private static let navigationBarLeadingPlacement = ToolbarItemPlacement.automatic
    #endif

    #if !os(macOS)
    private static let navigationBarTrailingPlacement = ToolbarItemPlacement.navigationBarTrailing
    #else
    private static let navigationBarTrailingPlacement = ToolbarItemPlacement.automatic
    #endif
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Store<AppState, AppAction>(
            initialState: AppState(),
            reducer: appReducer,
            environment: .preview
        ))
    }
}

struct ContentViewGameOver_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Store<AppState, AppAction>(
            initialState: .mocked {
                $0.game.isGameOver = true
                $0.game.discoveredSymbolTypes = SymbolType.allCases
                $0.game.moves = 42
                $0.game.symbols = .predictedGameSymbols(isCardsFaceUp: true)
            },
            reducer: appReducer,
            environment: .preview
        ))
    }
}

struct ContentViewAlmostFinished_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Store(
            initialState: .almostFinishedGame,
            reducer: appReducer,
            environment: .preview
        ))
    }
}

extension AppState {
    static func mocked(modifier: (inout Self) -> Void) -> Self {
        var state = AppState()
        modifier(&state)
        return state
    }

    static let almostFinishedGame: Self = .mocked {
        $0.game.isGameOver = false
        $0.game.discoveredSymbolTypes = SymbolType.allCases.filter({ $0 != .cave })
        $0.game.moves = 142
        $0.game.symbols = [Symbol].predictedGameSymbols(isCardsFaceUp: true).map {
            if $0.type == .cave {
                return Symbol(id: $0.id, type: $0.type, isFaceUp: false)
            }
            return $0
        }
    }
}

extension AnyScheduler
where
    SchedulerTimeType == DispatchQueue.SchedulerTimeType,
    SchedulerOptions == DispatchQueue.SchedulerOptions {
    static var preview: Self { DispatchQueue.main.eraseToAnyScheduler() }
}

extension AppEnvironment {
    static let preview: Self = AppEnvironment(
        mainQueue: .preview,
        loadHighScores: { .preview },
        saveHighScores: { _ in },
        generateRandomSymbols: { _ in .predictedGameSymbols },
        saveConfiguration: { _ in },
        loadConfiguration: { ConfigurationState() }
    )
}
#endif
