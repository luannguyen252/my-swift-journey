import XCTest
@testable import MemoArt
import ComposableArchitecture

class GameCoreTests: XCTestCase {
    let scheduler = DispatchQueue.testScheduler
    typealias Step = TestStore<GameState, GameState, GameAction, GameAction, GameEnvironment>.Step

    func testReturningCards() {
        let store = TestStore(
            initialState: GameState(cards: .predicted),
            reducer: gameReducer,
            environment: .mocked(scheduler: scheduler)
        )

        store.assert(
            .send(.shuffleCards) {
                $0.cards = .predicted
            },
            .send(.cardReturned(0)) {
                $0.cards = self.newCards(cardsFacedUpIds: [0], cardsFacedDownIds: [], cards: $0.cards)
                $0.moves = 0
            },
            .receive(.save),
            .send(.cardReturned(1)) {
                $0.cards = self.newCards(cardsFacedUpIds: [0, 1], cardsFacedDownIds: [], cards: $0.cards)
                $0.moves = 1
            },
            .receive(.save),
            .send(.cardReturned(2)) {
                // Returning on third card will turn back the two firsts
                $0.cards = self.newCards(cardsFacedUpIds: [2], cardsFacedDownIds: [0, 1], cards: $0.cards)
                $0.moves = 1
            },
            .receive(.save),
            .send(.cardReturned(12)) {
                $0.cards = self.newCards(cardsFacedUpIds: [2, 12], cardsFacedDownIds: [], cards: $0.cards)
                $0.moves = 2
                $0.discoveredArts = [.cave]
            },
            .receive(.save)
        )
    }

    private func newCards(cardsFacedUpIds: [Int], cardsFacedDownIds: [Int], cards: [Card]) -> [Card] {
        cards.map { card in
            switch card.id {
            case let cardId where cardsFacedUpIds.contains(cardId):
                return Card(id: cardId, art: card.art, isFaceUp: true)
            case let cardId where cardsFacedDownIds.contains(cardId):
                return Card(id: cardId, art: card.art, isFaceUp: false)
            default: return card
            }
        }
    }

    func returnAllCardsSteps(level: DifficultyLevel) -> [Step] {
        let halfCardsCount = level.cardsCount/2
        return (0..<halfCardsCount).flatMap { cardId -> [Step] in
            let firstCardId = cardId
            // The second card to for a pair is `halfCardsCount` away from the first card
            // For instance, for normal, half count is 10, if the first card id is 1, the second id is 11
            let secondCardId = cardId + halfCardsCount

            let fromFirstCardToCardId = 0..<firstCardId
            let fromHalfToSecondCardId = halfCardsCount..<secondCardId

            return [
                .send(.cardReturned(firstCardId)) {
                    $0.cards = $0.cards.map { card in
                        switch card.id {
                        case firstCardId: return Card(id: cardId, art: card.art, isFaceUp: true)
                        case fromFirstCardToCardId: return Card(id: card.id, art: card.art, isFaceUp: true)
                        case fromHalfToSecondCardId: return Card(id: card.id, art: card.art, isFaceUp: true)
                        default: return Card(id: card.id, art: card.art, isFaceUp: false)
                        }
                    }
                },
                .receive(.save),
                .send(.cardReturned(secondCardId)) {
                    $0.cards = $0.cards.map { card in
                        switch card.id {
                        case firstCardId: return Card(id: cardId, art: card.art, isFaceUp: true)
                        case secondCardId: return Card(id: cardId + halfCardsCount, art: card.art, isFaceUp: true)
                        case fromFirstCardToCardId: return Card(id: card.id, art: card.art, isFaceUp: true)
                        case fromHalfToSecondCardId: return Card(id: card.id, art: card.art, isFaceUp: true)
                        default: return Card(id: card.id, art: card.art, isFaceUp: false)
                        }
                    }
                    let numberOfCardReturned = (firstCardId + 1) * 2
                    $0.discoveredArts = Art.allCases.prefix(numberOfCardReturned/2)
                    $0.moves = numberOfCardReturned/2
                    if numberOfCardReturned == $0.level.cardsCount {
                        $0.isGameOver = true
                    }
                },
                .receive(secondCardId + 1 < level.cardsCount ? .save : .clearBackup),
            ]
        }
    }
}

extension GameEnvironment {
    static func mocked(
        scheduler: TestSchedulerOf<DispatchQueue>,
        modifier: (inout Self) -> Void = { _ in }
    ) -> Self {
        var gameEnvironment = GameEnvironment(
            mainQueue: scheduler.eraseToAnyScheduler(),
            save: { _ in },
            load: { GameState() },
            clearBackup: { }
        )
        modifier(&gameEnvironment)
        return gameEnvironment
    }
}
