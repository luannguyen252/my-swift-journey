import SwiftUI

class EmojiMemoryGame:ObservableObject{
     @Published private var model:MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String>{
        let emojis = ["🌏","🔥"]
        return MemoryGame<String>(numberOfPairOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // Access To The Model
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    // Intents
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
