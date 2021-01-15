//
//  SetGame.swift
//  Set Game
//
//  Created by Matthew Trump on 7/16/20.
//  Copyright © 2020 Matthew Trump. All rights reserved.
//

import Foundation

struct SetGame{
    
    private(set) var deck: Array<Card>
    private var cardIndex : Int = 0

    var score : Int = 0
    var hasCardsRemaining : Bool {
        return cardIndex < deck.count
    }
    init(){
        deck = Array<Card>()
        var index = 0
        for number in 1...3 {
            for color in CardColor.allCases {
                for shape in CardShape.allCases {
                    for shading in CardShading.allCases {
                        deck.append(Card(id: index,  color: color, number: number, shading: shading, shape: shape ))
                        index = index + 1
                    }
                }
            }
        }
        deck.shuffle()
    }
    var selectedCards: Array<Card>{
        deck.filter{card in
            card.isSelected
        }
    }

    func cardsMakeASet(selected: Array<Card>) -> Bool {
        if(selected.count != 3){
            return false
        }
        let numbersAllMatch : Bool  = (selected[0].number == selected[1].number && selected[1].number == selected[2].number)
        let numbersAllDiffer : Bool = (selected[0].number != selected[1].number && selected[1].number != selected[2].number && selected[0].number != selected[2].number)
        
        let colorsAllMatch : Bool  = (selected[0].color == selected[1].color && selected[1].color == selected[2].color)
        let colorsAllDiffer : Bool = (selected[0].color != selected[1].color && selected[1].color != selected[2].color && selected[0].color != selected[2].color)
        
        let shapesAllMatch : Bool  = (selected[0].shape == selected[1].shape && selected[1].shape == selected[2].shape)
        let shapesAllDiffer : Bool = (selected[0].shape != selected[1].shape && selected[1].shape != selected[2].shape && selected[0].shape != selected[2].shape)
        
        let shadingsAllMatch : Bool  = (selected[0].shading == selected[1].shading && selected[1].shading == selected[2].shading)
        let shadingsAllDiffer : Bool = (selected[0].shading != selected[1].shading && selected[1].shading != selected[2].shading && selected[0].shading != selected[2].shading)
        
        return (numbersAllMatch || numbersAllDiffer) && (colorsAllMatch || colorsAllDiffer) && (shapesAllMatch || shapesAllDiffer) && (shadingsAllMatch || shadingsAllDiffer)
    }
    mutating func deselectAll(){
        selectedCards.forEach{ card in
            if let index = deck.firstIndex(matching: card){
                deck[index].isSelected   = false
                deck[index].isMismatched = false
            }
        }
    }


    mutating func choose(card: Card){
        if(selectedCards.count<3){
            if let chosenIndex = deck.firstIndex(matching: card){

                deck[chosenIndex].isSelected = !deck[chosenIndex].isSelected
            
                if(selectedCards.count == 3){
                    if(cardsMakeASet(selected: self.selectedCards)){
                        selectedCards.forEach{ card in
                            if let index = deck.firstIndex(matching: card){
                                deck[index].wasMatched = true
                            }
                        }
                        self.score = self.score + 1
                    }else{
                        selectedCards.forEach{ card in
                            if let index = deck.firstIndex(matching: card){
                                deck[index].isMismatched = true
                            }
                        }
                    }
                }
            }
        }else{
            if(hasCardsRemaining){
                replaceMatchedCards()
            }else{
                deck.filter{ card in
                    card.isSelected && card.wasMatched
                }.forEach{ card in
                     if let index = deck.firstIndex(matching: card){
                        deck[index].wasDiscarded = true
                     }
                }
            }
            deselectAll()
            if let chosenIndex = deck.firstIndex(matching: card){
                deck[chosenIndex].isSelected = true
            }
        }
       
    }
    mutating func replaceMatchedCards(){
        selectedCards.forEach{ card in
            if(card.wasMatched){
                if let index = deck.firstIndex(matching: card){
                    deck[index].wasDiscarded = true
                    if(cardIndex<deck.count){
                        deck[cardIndex].wasDealt = true
                        cardIndex = cardIndex + 1
                    }
                }
            }
        }
    }
    
    
    mutating func dealCards(_ number: Int){
        for _ in 0..<number{
            if(cardIndex<deck.count){
                deck[cardIndex].wasDealt = true
                cardIndex = cardIndex + 1
            }
        }
    }
      
    enum CardColor : CaseIterable{
        case red
        case green
        case blue
    }
    enum CardShading : CaseIterable {
        case filled
        case striped
        case empty
    }
    
    enum CardShape : CaseIterable {
        case circle
        case diamond
        case bar
    }
    
    struct Card : Identifiable {

        var wasDealt: Bool      = false
        var isSelected : Bool   = false
        var wasMatched: Bool    = false
        var isMismatched: Bool  = false
        var wasDiscarded : Bool = false
        var id: Int
        var color: CardColor
        var number: Int
        var shading: CardShading
        var shape: CardShape
    }
}
