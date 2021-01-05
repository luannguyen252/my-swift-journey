import UIKit

struct Card: CustomStringConvertible {
    let rank: Rank
    let suit: Suit
    
    var description: String {
        return "\(rank.description) \(suit.description)"
    }
    
    enum Rank: Int, CaseIterable, CustomStringConvertible {
        case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
        
        var description: String {
            switch self {
            case .jack:
                return "Jack"
            case .queen:
                return "Queen"
            case .king:
                return "King"
            case .ace:
                return "Ace"
            default:
                return "\(rawValue)"
            }
        }
    }
    
    enum Suit: String, CaseIterable, CustomStringConvertible {
        case heart, diamond, club, spades
        
        var description: String {
            switch self {
            case .heart:
                return "♥️"
            case .diamond:
                return "♦️"
            case .club:
                return "♣️"
            case .spades:
                return "♠️"
            }
        }
    }
}


var deck: [Card] = []
for rank in Card.Rank.allCases {
    for suit in Card.Suit.allCases {
        let card = Card(rank: rank, suit: suit)
        deck.append(card)
    }
}

print(deck)
print(deck.shuffled())
