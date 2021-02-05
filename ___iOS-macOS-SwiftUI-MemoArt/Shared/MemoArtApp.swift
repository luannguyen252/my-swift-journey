import SwiftUI
import ComposableArchitecture

@main
struct MemoArtApp: App {
    struct ViewState: Equatable {
        var isFireworksDisplayed: Bool
        var isNewGameButtonEnabled: Bool
        var gameLevel: DifficultyLevel
        var isAboutPresented: Bool
    }

    enum ViewAction {
        case loadGame
        case loadHighScores
        case alertUserBeforeNewGame
        case presentAbout
        case hideAbout
    }

    #if os(macOS)
    // swiftlint:disable:next weak_delegate
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    #endif

    let store: Store<AppState, AppAction> = {
        let usePredictedArts = CommandLine.arguments.contains("--use-predicted-arts")
        let predictedLoadGame = { GameState(
            cards: .predicted(level: Self.loadConfiguration().difficultyLevel),
            level: Self.loadConfiguration().difficultyLevel
        ) }

        return Store(
            initialState: AppState(configuration: loadConfiguration()),
            reducer: appReducer,
            environment: AppEnvironment(
                mainQueue: DispatchQueue.main.eraseToAnyScheduler(),
                saveGame: saveGame,
                loadGame: usePredictedArts ? predictedLoadGame : loadGame,
                clearGameBackup: clearGameBackup,
                loadHighScores: loadHighScores,
                saveHighScores: saveHighScores,
                generateRandomCards: { .newGame(from: $0, level: $1) },
                saveConfiguration: saveConfiguration,
                loadConfiguration: loadConfiguration
            )
    )

    }()

    #if DEBUG
    init() { handleLaunchArguments() }
    #endif

    var body: some Scene {
        WithViewStore(store.scope(state: { $0.view }, action: AppAction.view)) { viewStore in
            WindowGroup {
                ZStack {
                    MainView(store: store)
                    if viewStore.isFireworksDisplayed {
                        FireworksView(level: viewStore.gameLevel)
                    }
                }
                .background(EmptyView().sheet(
                    isPresented: viewStore.binding(get: { $0.isAboutPresented }, send: .hideAbout)
                ) {
                    AboutSheetView(store: store)
                })
                .modifier(SetupNewGameAlert(store: store.gameStore))
                .onAppear { viewStore.send(.loadGame) }
                .onAppear { viewStore.send(.loadHighScores) }
            }
            .commands { commands(viewStore: viewStore) }
        }
    }

    private func commands(viewStore: ViewStore<ViewState, ViewAction>) -> some Commands {
        Group {
            CommandGroup(replacing: CommandGroupPlacement.newItem) {
                Button { viewStore.send(.alertUserBeforeNewGame) } label: {
                    Text("New game")
                }
                .disabled(!viewStore.isNewGameButtonEnabled)
                .keyboardShortcut("n", modifiers: .command)
            }
            CommandGroup(replacing: CommandGroupPlacement.pasteboard) {
                EmptyView()
            }
            CommandGroup(replacing: CommandGroupPlacement.undoRedo) {
                EmptyView()
            }
            CommandGroup(replacing: CommandGroupPlacement.help) {
                EmptyView()
            }
            CommandGroup(replacing: CommandGroupPlacement.appInfo) {
                Button { viewStore.send(.presentAbout) } label: {
                    Text("About MemoArt")
                }
            }
        }
    }
}

private extension AppState {
    var view: MemoArtApp.ViewState {
        MemoArtApp.ViewState(
            isFireworksDisplayed: game.isGameOver,
            isNewGameButtonEnabled: game.isGameInProgress,
            gameLevel: game.level,
            isAboutPresented: isAboutPresented
        )
    }
}

private extension AppAction {
    static func view(localAction: MemoArtApp.ViewAction) -> Self {
        switch localAction {
        case .loadGame: return .game(.load)
        case .loadHighScores: return .highScores(.load)
        case .alertUserBeforeNewGame: return .game(.alertUserBeforeNewGame)
        case .presentAbout: return .presentAbout
        case .hideAbout: return .hideAbout
        }
    }
}

// MARK: Game Persistence
extension MemoArtApp {
    private static let gameKey = "MemoArtGameState"

    private static func saveGame(game: GameState) {
        UserDefaults.standard.setValue(try? JSONEncoder().encode(game), forKey: gameKey)
    }

    private static func loadGame() -> GameState {
        guard
            let data = UserDefaults.standard.data(forKey: gameKey),
            let game = try? JSONDecoder().decode(GameState.self, from: data)
        else {
            let configuration = loadConfiguration()
            return GameState(
                cards: .newGame(from: configuration.selectedArts, level: configuration.difficultyLevel),
                level: configuration.difficultyLevel
            )
        }

        return game
    }

    private static func clearGameBackup() {
        UserDefaults.standard.removeObject(forKey: gameKey)
    }
}

// MARK: High Scores Persistence
extension MemoArtApp {
    private static let highScoresKey = "MemoArtHighScores"

    private static func loadHighScores() -> HighScoresState {
        migrateHighScoresIfNeeded()
        guard
            let data = UserDefaults.standard.data(forKey: highScoresKey),
            let highScores = try? JSONDecoder().decode(HighScoresState.self, from: data)
        else { return HighScoresState(boards: Boards(easy: [], normal: [], hard: [])) }

        return highScores
    }

    private static func saveHighScores(highScores: HighScoresState) {
        UserDefaults.standard.setValue(try? JSONEncoder().encode(highScores), forKey: highScoresKey)
    }

    // This method should be removed when the version 1.9.0 is out.
    private static func migrateHighScoresIfNeeded() {
        guard let data = UserDefaults.standard.data(forKey: highScoresKey) else { return }
        do {
            _ = try JSONDecoder().decode(HighScoresState.self, from: data)
            // If we are able to decode the new HighScoresState, it means the migration already occurred
            // or no migrations are needed (new install).
            return
        } catch {
            // If we are not able to decode the new HighScoresState, we should migrate old data
        }

        guard let highScores = try? JSONDecoder().decode([HighScore].self, from: data) else { return }

        let newHighScores = HighScoresState(boards: Boards(
            easy: [],
            normal: highScores,
            hard: []
        ))
        UserDefaults.standard.setValue(try? JSONEncoder().encode(newHighScores), forKey: highScoresKey)
    }
}

// MARK: Configuration Persistence
extension MemoArtApp {
    private static let configurationKey = "MemoArtConfigurationState"

    private static func saveConfiguration(configuration: ConfigurationState) {
        UserDefaults.standard.setValue(try? JSONEncoder().encode(configuration), forKey: configurationKey)
    }

    private static func loadConfiguration() -> ConfigurationState {
        guard
            let data = UserDefaults.standard.data(forKey: configurationKey),
            let configuration = try? JSONDecoder().decode(ConfigurationState.self, from: data)
        else { return ConfigurationState() }

        return configuration
    }
}

#if DEBUG
// MARK: Handle Launch Arguments
extension MemoArtApp {
    private func handleLaunchArguments() {
        if CommandLine.arguments.contains("--reset-game-backup") {
            Self.clearGameBackup()
        }
        if CommandLine.arguments.contains("--reset-configuration") {
            Self.saveConfiguration(configuration: ConfigurationState())
        }
    }
}
#endif
