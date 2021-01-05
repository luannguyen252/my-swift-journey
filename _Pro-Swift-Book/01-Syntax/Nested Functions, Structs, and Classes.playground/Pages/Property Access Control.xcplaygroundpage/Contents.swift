//: [Previous](@previous)

import UIKit

// ⚠️ If a property uses a private type, the property itself must be private

struct Deck {
    
    struct Card {
        private enum Suit {
            case hearts, diamonds, clubs, spades
        }
        
        private var suit: Suit
        var rank: Int
        
        init(rank: Int) {
            self.rank = rank
            self.suit = .hearts
        }
    }
    
    var cards: [Card] = [
        Card(rank: 1),
        Card(rank: 2),
    ]
}



let deck = Deck()

deck.cards


//: [Next](@next)
