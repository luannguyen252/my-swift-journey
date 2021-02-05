import XCTest
@testable import MemoArt
import ComposableArchitecture

// MARK: AppCore High Score related tests
extension AppCoreTests {
    func testPresentNewHighScoreForAnEmptyHighScoresBoard() throws {
        let store = TestStore(
            initialState: AppState.almostFinishedGame,
            reducer: appReducer,
            environment: .mocked(scheduler: scheduler)
        )

        store.assert(
            .send(.game(.cardReturned(2))) {
                $0.game.cards = $0.game.cards.map { card in
                    switch card.id {
                    case 2: return Card(id: 2, art: .cave, isFaceUp: true)
                    default: return card
                    }
                }
            },
            .receive(.game(.save)),
            .send(.game(.cardReturned(12))) {
                $0.game.cards = $0.game.cards.map { card in
                    switch card.id {
                    case 12: return Card(id: 12, art: .cave, isFaceUp: true)
                    default: return card
                    }
                }
                $0.game.isGameOver = true
                $0.game.moves = 143
                $0.game.discoveredArts = $0.game.discoveredArts + [.cave]
            },
            .receive(.game(.clearBackup)),
            .do { self.scheduler.advance(by: .seconds(0.8)) },
            .receive(.presentNewHighScoreView) {
                $0.isNewHighScoreEntryPresented = true
            }
        )
    }

    func testPresentNewHighScoreForAFullHighScoresBoard() throws {
        let store = TestStore(
            initialState: AppState.mocked {
                $0.game = AppState.almostFinishedGame.game
                $0.game.moves = 10
                $0.highScores = .test
            },
            reducer: appReducer,
            environment: .mocked(scheduler: scheduler)
        )

        store.assert(
            .send(.game(.cardReturned(2))) {
                $0.game.cards = $0.game.cards.map { card in
                    switch card.id {
                    case 2: return Card(id: 2, art: .cave, isFaceUp: true)
                    default: return card
                    }
                }
            },
            .receive(.game(.save)),
            .send(.game(.cardReturned(12))) {
                $0.game.cards = $0.game.cards.map { card in
                    switch card.id {
                    case 12: return Card(id: 12, art: .cave, isFaceUp: true)
                    default: return card
                    }
                }
                $0.game.isGameOver = true
                $0.game.moves = 11
                $0.game.discoveredArts = $0.game.discoveredArts + [.cave]
            },
            .receive(.game(.clearBackup)),
            .do { self.scheduler.advance(by: .seconds(0.8)) },
            .receive(.presentNewHighScoreView) {
                $0.isNewHighScoreEntryPresented = true
            }
        )
    }

    func testDoNotPresentNewHighScoreForAFullHighScoresBoardWhenTheScoreIsTooBad() throws {
        let store = TestStore(
            initialState: AppState.mocked {
                $0.game = AppState.almostFinishedGame.game
                $0.highScores = .test
            },
            reducer: appReducer,
            environment: .mocked(scheduler: scheduler)
        )

        store.assert(
            .send(.game(.cardReturned(2))) {
                $0.game.cards = $0.game.cards.map { card in
                    switch card.id {
                    case 2: return Card(id: 2, art: .cave, isFaceUp: true)
                    default: return card
                    }
                }
            },
            .receive(.game(.save)),
            .send(.game(.cardReturned(12))) {
                $0.game.cards = $0.game.cards.map { card in
                    switch card.id {
                    case 12: return Card(id: 12, art: .cave, isFaceUp: true)
                    default: return card
                    }
                }
                $0.game.isGameOver = true
                $0.game.moves = 143
                $0.game.discoveredArts = $0.game.discoveredArts + [.cave]
            },
            .receive(.game(.clearBackup))
        )
    }

    func testEnteringANewHighScore() {
        let store = TestStore(
            initialState: AppState.mocked {
                $0.isNewHighScoreEntryPresented = true
            },
            reducer: appReducer,
            environment: .mocked(scheduler: scheduler)
        )

        store.assert(
            .send(.newHighScoreEntered) {
                $0.isNewHighScoreEntryPresented = false
            }
        )
    }
}
