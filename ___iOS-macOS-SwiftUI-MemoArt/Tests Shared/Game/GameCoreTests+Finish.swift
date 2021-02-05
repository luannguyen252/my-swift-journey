import XCTest
@testable import MemoArt
import ComposableArchitecture

// MARK: GameCore Finishing a game related tests
extension GameCoreTests {
    func testFinishingAGame() {
        let store = TestStore(
            initialState: GameState(cards: .predicted),
            reducer: gameReducer,
            environment: .mocked(scheduler: scheduler)
        )

        store.assert(
            [
                .send(.shuffleCards) {
                    $0.cards = .predicted
                },
            ]
            +
            returnAllCardsSteps(level: .normal)
        )
    }

    func testFinishingAGameInEasy() {
        let store = TestStore(
            initialState: GameState(
                cards: .predicted(level: .easy),
                level: .easy
            ),
            reducer: gameReducer,
            environment: .mocked(scheduler: scheduler)
        )

        store.assert(
            [
                .send(.shuffleCards) {
                    $0.cards = .predicted(level: .easy)
                },
            ]
            +
            returnAllCardsSteps(level: .easy)
        )
    }

    func testFinishingAGameInHard() {
        let store = TestStore(
            initialState: GameState(
                cards: .predicted(level: .hard),
                level: .hard
            ),
            reducer: gameReducer,
            environment: .mocked(scheduler: scheduler)
        )

        store.assert(
            [
                .send(.shuffleCards) {
                    $0.cards = .predicted(level: .hard)
                },
            ]
            +
            returnAllCardsSteps(level: .hard)
        )
    }
}
