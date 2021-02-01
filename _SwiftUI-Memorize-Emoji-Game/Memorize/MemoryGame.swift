import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card:Card) {
        print("Card Choosen: \(card)")
        let choosenIndex = indexOf(of: card)
        cards[choosenIndex].isFaceUp = !cards[choosenIndex].isFaceUp
    }
    
    func indexOf(of card:Card) -> Int {
        for index in 0 ..< cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }

        return 0
    }
    
    init(numberOfPairOfCards:Int, cardContentFactory:(Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0 ..< numberOfPairOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
