import XCTest
@testable import MemoArt
import ComposableArchitecture

class AppCoreTests: XCTestCase {
    let scheduler = DispatchQueue.testScheduler
    typealias Step = TestStore<AppState, AppState, AppAction, AppAction, AppEnvironment>.Step

    func testSavingConfiguration() {
        let expectingSaveConfigurationToBeCalled = expectation(description: "Expect save configuration to be called")
        let mockedSaveConfiguration: (ConfigurationState) -> Void = { _ in
            expectingSaveConfigurationToBeCalled.fulfill()
        }
        let store = TestStore(
            initialState: AppState(),
            reducer: appReducer,
            environment: .mocked(scheduler: scheduler) {
                $0.saveConfiguration = mockedSaveConfiguration
            }
        )
        store.assert(
            .send(.configuration(.save))
        )
        wait(for: [expectingSaveConfigurationToBeCalled], timeout: 0.1)
    }

    func testLoadConfiguration() {
        let expectingLoadConfigurationToBeCalled = expectation(description: "Expect load configuration to be called")
        let mockedLoadConfiguration: () -> ConfigurationState = {
            expectingLoadConfigurationToBeCalled.fulfill()
            return ConfigurationState()
        }
        let store = TestStore(
            initialState: AppState(),
            reducer: appReducer,
            environment: .mocked(scheduler: scheduler) {
                $0.loadConfiguration = mockedLoadConfiguration
            }
        )
        store.assert(
            .send(.configuration(.load)),
            .receive(.game(.shuffleCards)) {
                $0.game.cards = .predicted
            }
        )
        wait(for: [expectingLoadConfigurationToBeCalled], timeout: 0.1)
    }

    func testShuffleCardWithNewDifficultyLevelConfigured() {
        let store = TestStore(
            initialState: AppState(),
            reducer: appReducer,
            environment: .mocked(scheduler: scheduler)
        )
        store.assert(
            .send(.game(.new)),
            .receive(.game(.clearBackup)),
            .do { self.scheduler.advance(by: .seconds(0.5)) },
            .receive(.game(.shuffleCards)) {
                $0.game.cards = .predicted(level: .normal)
            },
            .send(.configuration(.changeDifficultyLevel(.easy))) {
                $0.configuration.difficultyLevel = .easy
            },
            .receive(.configuration(.save)),
            .receive(.game(.new)),
            .receive(.game(.clearBackup)),
            .do { self.scheduler.advance(by: .seconds(0.5)) },
            .receive(.game(.shuffleCards)) {
                $0.game.level = .easy
                $0.game.cards = .predicted(level: .easy)
            }
        )
    }

    func testConfiguringDifficultyLevelStartNewGameWhenGameHasNotStartedYet() {
        let store = TestStore(
            initialState: AppState(),
            reducer: appReducer,
            environment: .mocked(scheduler: scheduler)
        )
        store.assert(
            .send(.configuration(.changeDifficultyLevel(.easy))) {
                $0.configuration.difficultyLevel = .easy
            },
            .receive(.configuration(.save)),
            .receive(.game(.new)),
            .receive(.game(.clearBackup)),
            .do { self.scheduler.advance(by: .seconds(0.5)) },
            .receive(.game(.shuffleCards)) {
                $0.game.cards = .predicted(level: .easy)
                $0.game.level = .easy
            },

            .send(.game(.cardReturned(0))) {
                $0.game.cards = $0.game.cards.map { $0.id == 0 ? Card(id: 0, art: $0.art, isFaceUp: true) : $0 }
            },
            .receive(.game(.save)),
            .send(.configuration(.changeDifficultyLevel(.normal))) {
                $0.configuration.difficultyLevel = .normal
            },
            .receive(.configuration(.save)),
            .receive(.game(.new)) {
                $0.game.cards = $0.game.cards.map { Card(id: $0.id, art: $0.art, isFaceUp: false) }
            },
            .receive(.game(.clearBackup)),
            .do { self.scheduler.advance(by: .seconds(0.5)) },
            .receive(.game(.shuffleCards)) {
                $0.game.cards = .predicted(level: .normal)
                $0.game.level = .normal
            },

            .send(.game(.cardReturned(0))) {
                $0.game.cards = $0.game.cards.map { $0.id == 0 ? Card(id: 0, art: $0.art, isFaceUp: true) : $0 }
            },
            .receive(.game(.save)),
            .send(.game(.cardReturned(1))) {
                $0.game.cards = $0.game.cards.map { $0.id == 1 ? Card(id: 1, art: $0.art, isFaceUp: true) : $0 }
                $0.game.moves = 1
            },
            .receive(.game(.save)),
            .send(.configuration(.changeDifficultyLevel(.hard))) {
                $0.configuration.difficultyLevel = .hard
            },
            .receive(.configuration(.save)),
            // As game has already started, we shouldn't receive a .game(.new) action anymore
            // But instead we will receive the disclaimer about starting a new game
            .receive(.presentDifficultyLevelHasChanged) {
                $0.isDifficultyLevelHasChangedPresented = true
            }
        )
    }

    func testChangingLevelWillDisplayADisclaimerMessageAskingToSetANewGame() {
        let store = TestStore(
            initialState: .mocked {
                $0.game.moves = 42
            },
            reducer: appReducer,
            environment: .mocked(scheduler: scheduler)
        )

        store.assert(
            .send(.configuration(.changeDifficultyLevel(.easy))) {
                $0.configuration.difficultyLevel = .easy
            },
            .receive(.configuration(.save)),
            .receive(.presentDifficultyLevelHasChanged) {
                $0.isDifficultyLevelHasChangedPresented = true
            }
        )
    }

    func testPresentAndHideAbout() {
        let store = TestStore(
            initialState: AppState(),
            reducer: appReducer,
            environment: .mocked(scheduler: scheduler)
        )

        store.assert(
            .send(.presentAbout) {
                $0.isAboutPresented = true
            },
            .send(.hideAbout) {
                $0.isAboutPresented = false
            }
        )
    }
}

extension AppEnvironment {
    static func mocked(
        scheduler: TestSchedulerOf<DispatchQueue>,
        modifier: (inout Self) -> Void = { _ in }
    ) -> Self {
        var appEnvironment = AppEnvironment(
            mainQueue: scheduler.eraseToAnyScheduler(),
            saveGame: { _ in },
            loadGame: { GameState() },
            clearGameBackup: { },
            loadHighScores: { .test },
            saveHighScores: { _ in },
            generateRandomCards: { _, level in .predicted(level: level) },
            saveConfiguration: { _ in },
            loadConfiguration: { ConfigurationState() }
        )
        modifier(&appEnvironment)
        return appEnvironment
    }
}
