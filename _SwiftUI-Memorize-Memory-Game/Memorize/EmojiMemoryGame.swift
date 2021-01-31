import SwiftUI

// View Model
class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> =  EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🐝","🐮", "🦊", "🐶","😾"]
        // Assignment task 4
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2..<5)) { pairIndex in
            return emojis[pairIndex]
        }
    }
        
    // MARK: - Access to Model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var pairs: Int {
        return cards.count / 2
    }
    
    // MARK: - Intent(s)
    /*
     Intents are the use actions that are handled by the view model, for example user selected card,
     or user taped a button or user performed swipped action.
     
     Basically something that will have significant changes
     View cannot directly communicate with the Model , instead it need to communicate to view model
     using intents, and view model then communicates with the underneat model.
    */
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

#if DEBUG
struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, Emoji Memory Game!")
    }
}
#endif
