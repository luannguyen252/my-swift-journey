import XCTest
@testable import MemoArt
import ComposableArchitecture

// MARK: GameCore New Game related tests
extension GameCoreTests {
    func testNewGame() {
        let store = TestStore(
            initialState: GameState(cards: .predicted),
            reducer: gameReducer,
            environment: .mocked(scheduler: scheduler)
        )
        store.assert(
            .send(.new) {
                $0.isGameOver = false
                $0.discoveredArts = []
                $0.moves = 0
                $0.cards = $0.cards.map { Card(id: $0.id, art: $0.art, isFaceUp: false) }
            },
            .receive(.clearBackup),
            .do { self.scheduler.advance(by: .seconds(0.5)) },
            .receive(.shuffleCards) {
                $0.cards = .predicted
            }
        )
    }

    func testNewGameWithHardDifficultyLevel() {
        let store = TestStore(
            initialState: GameState(cards: .predicted(level: .hard)),
            reducer: gameReducer,
            environment: .mocked(scheduler: scheduler)
        )
        store.assert(
            .send(.new) {
                $0.isGameOver = false
                $0.discoveredArts = []
                $0.moves = 0
                $0.cards = $0.cards.map { Card(id: $0.id, art: $0.art, isFaceUp: false) }
            },
            .receive(.clearBackup),
            .do { self.scheduler.advance(by: .seconds(0.5)) },
            .receive(.shuffleCards) {
                $0.cards = .predicted(level: .hard)
            }
        )
    }

    func testNewGameWithEasyDifficultyLevel() {
        let store = TestStore(
            initialState: GameState(cards: .predicted(level: .easy)),
            reducer: gameReducer,
            environment: .mocked(scheduler: scheduler)
        )
        store.assert(
            .send(.new) {
                $0.isGameOver = false
                $0.discoveredArts = []
                $0.moves = 0
                $0.cards = $0.cards.map { Card(id: $0.id, art: $0.art, isFaceUp: false) }
            },
            .receive(.clearBackup),
            .do { self.scheduler.advance(by: .seconds(0.5)) },
            .receive(.shuffleCards) {
                $0.cards = .predicted(level: .easy)
            }
        )
    }

    func testPresentAndHideNewGameAlert() {
        let store = TestStore(
            initialState: GameState(),
            reducer: gameReducer,
            environment: .mocked(scheduler: scheduler)
        )
        store.assert(
            .send(.presentNewGameAlert) {
                $0.isNewGameAlertPresented = true
            },
            .send(.hideNewGameAlert) {
                $0.isNewGameAlertPresented = false
            }
        )
    }

    func testAlertUserBeforeNewGameAlertWhenAGameAlreadyStarted() {
        let store = TestStore(
            initialState: GameState(moves: 1),
            reducer: gameReducer,
            environment: .mocked(scheduler: scheduler)
        )
        store.assert(
            .send(.alertUserBeforeNewGame),
            .receive(.presentNewGameAlert) {
                $0.isNewGameAlertPresented = true
            }
        )
    }

    func testAlertUserBeforeNewGameAlertWhenAGameIsOver() {
        let store = TestStore(
            initialState: GameState(moves: 42, cards: .predicted, isGameOver: true),
            reducer: gameReducer,
            environment: .mocked(scheduler: scheduler)
        )
        store.assert(
            .send(.alertUserBeforeNewGame),
            .receive(.new) {
                $0.isGameOver = false
                $0.discoveredArts = []
                $0.moves = 0
                $0.cards = $0.cards.map { Card(id: $0.id, art: $0.art, isFaceUp: false) }
            },
            .receive(.clearBackup),
            .do { self.scheduler.advance(by: .seconds(0.5)) },
            .receive(.shuffleCards) {
                $0.cards = .predicted
            }
        )
    }

    func testAlertUserBeforeNewGameAlertWhenHaveNotStarted() {
        let store = TestStore(
            initialState: GameState(moves: 0, cards: .predicted),
            reducer: gameReducer,
            environment: .mocked(scheduler: scheduler)
        )
        store.assert(
            .send(.alertUserBeforeNewGame),
            .receive(.new) {
                $0.isGameOver = false
                $0.discoveredArts = []
                $0.moves = 0
                $0.cards = $0.cards.map { Card(id: $0.id, art: $0.art, isFaceUp: false) }
            },
            .receive(.clearBackup),
            .do { self.scheduler.advance(by: .seconds(0.5)) },
            .receive(.shuffleCards) {
                $0.cards = .predicted
            }
        )
    }
}
