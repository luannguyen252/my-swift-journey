//
//  StandardSetGame.swift
//  Set Game
//
//  Created by Matthew Trump on 7/17/20.
//  Copyright © 2020 Matthew Trump. All rights reserved.
//

import SwiftUI

class StandardSetGame: ObservableObject {
    @Published private var model: SetGame = StandardSetGame.createSetGame()
    private static func createSetGame() -> SetGame{
        return SetGame()
    }
    
    var cards : Array<SetGame.Card>{
        model.deck.filter{ card in
            card.wasDealt && !card.wasDiscarded
        }
    }
    func choose(card: SetGame.Card){
        model.choose(card: card)
    }
    var hasCardsRemaining: Bool {
        return model.hasCardsRemaining
    }
    var score : Int {
        return model.score
    }

    var currentlyShowingMatch : Bool {
        cards.filter{card in
            card.wasMatched
        }.count == 3
    }
    
    func resetGame(){
        model = StandardSetGame.createSetGame()
    }
    func replaceMatchedCards(){
        model.replaceMatchedCards()
    }
    func dealCards(_ number: Int){
        model.dealCards(number)
    }
    func cheat(){
        if let matchingTriple = cards.firstMatchingTriple(matchBy: {(_ selected) in
            return model.cardsMakeASet(selected: selected)
        }){
            model.deselectAll()
            choose(card: matchingTriple[0])
            choose(card: matchingTriple[1])
        }
    }
//    func cheat(){
//        outerLoop: for firstIndex in 0..<cards.count{
//        let firstCard = cards[firstIndex]
//        for secondIndex in firstIndex+1..<cards.count{
//                let secondCard = cards[secondIndex]
//                for thirdIndex in secondIndex+1..<cards.count{
//                    let possibleMatch = [firstCard,secondCard,cards[thirdIndex]]
//                    if(model.cardsMakeASet(selected: possibleMatch)){
//                        //possibleMatch.shuffle()
//                        model.deselectAll()
//                        choose(card: possibleMatch[0])
//                        choose(card: possibleMatch[1])
//                        break outerLoop
//                    }
//                }
//            }
//        }
//    }
//
}
