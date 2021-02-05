import XCTest
@testable import MemoArt
import ComposableArchitecture

// MARK: AppCore Game related tests
extension AppCoreTests {
    func testShuffleCardWithRestrictedArts() {
        let selectedArts: [Art] = [
            .artDeco, .cave, .arty, .charcoal, .childish,
            .destructured, .geometric, .gradient, .impressionism, .moderArt,
        ]

        let store = TestStore(
            initialState: AppState(),
            reducer: appReducer,
            environment: .mocked(scheduler: scheduler) {
                $0.generateRandomCards = { _, _ in .predicted(from: selectedArts) }
            }
        )
        store.assert(
            .send(.game(.shuffleCards)) {
                $0.game.cards = .predicted(from: selectedArts)
            }
        )
    }

    func testConfiguringArtsWillReshuffleCardWhenGameHasNotStartedYet() {
        let store = TestStore(
            initialState: AppState(),
            reducer: appReducer,
            environment: .mocked(scheduler: scheduler)
        )

        // Without starting playing, select/unselect an art will reset the game
        var steps: [Step] = [
            .send(.configuration(.unselectArt(.cave))) {
                $0.configuration.selectedArts = Set(Art.allCases.filter({ $0 != .cave }))
            },
        ] + artSelectionTriggerNewGameSteps()
        steps += [
            .send(.configuration(.selectArt(.cave))) {
                $0.configuration.selectedArts = Set(Art.allCases)
            },
        ] + artSelectionTriggerNewGameSteps()

        // Return a card and unselect an art style, it will reset the game as well
        steps += [
            .send(.game(.cardReturned(0))) {
                $0.game.cards = $0.game.cards.map { $0.id == 0 ? Card(id: 0, art: $0.art, isFaceUp: true) : $0 }
            },
            .receive(.game(.save)),
        ]
        steps += [
            .send(.configuration(.unselectArt(.cave))) {
                $0.configuration.selectedArts = Set(Art.allCases.filter({ $0 != .cave }))
            },
            .receive(.game(.new)) {
                $0.game.cards = $0.game.cards.map { Card(id: $0.id, art: $0.art, isFaceUp: false) }
            },
        ] + resetGameSteps()

        // Return two cards and change art style configuration, as a game started, we shouldn't start a new game now
        steps += [
            .send(.game(.cardReturned(0))) {
                $0.game.cards = $0.game.cards.map { $0.id == 0 ? Card(id: 0, art: $0.art, isFaceUp: true) : $0 }
            },
            .receive(.game(.save)),
            .send(.game(.cardReturned(1))) {
                $0.game.cards = $0.game.cards.map { $0.id == 1 ? Card(id: 1, art: $0.art, isFaceUp: true) : $0 }
                $0.game.moves = 1
            },
            .receive(.game(.save)),
            .send(.configuration(.selectArt(.cave))) {
                $0.configuration.selectedArts = Set(Art.allCases)
            },
            .do { self.scheduler.advance(by: .seconds(2)) },
            .receive(.configuration(.save)),
        ]

        store.assert(steps)
    }

    private func resetGameSteps() -> [Step] {
        [
            .receive(.game(.clearBackup)),
            .do { self.scheduler.advance(by: .seconds(0.5)) },
            .receive(.game(.shuffleCards)) {
                $0.game.cards = .predicted
            },
            .do { self.scheduler.advance(by: .seconds(1.5)) },
            .receive(.configuration(.save)),
        ]
    }

    private func artSelectionTriggerNewGameSteps() -> [Step] {
        [.receive(.game(.new))] + resetGameSteps()
    }
}
