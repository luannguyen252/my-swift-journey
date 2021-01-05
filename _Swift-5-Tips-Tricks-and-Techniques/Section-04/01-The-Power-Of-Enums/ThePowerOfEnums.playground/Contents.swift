import UIKit

struct Card {
    
    let rank: Rank
    let suit: Suit
    
    enum Rank {
        case two, three, four, five, six, seven, eigth, nine, ten, jack, queen, king, ace
    }
    
    enum Suit {
        case heart, diamond, club, spades
    }
}

struct PokerHand {
    let cards: [Card]
}

PokerHand(cards: [Card(rank: .six, suit: .heart), Card(rank: .seven, suit: .club)])













