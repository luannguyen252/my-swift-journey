//
//  ContentView.swift
//  SetGame2020
//
//  Created by Matthew Trump on 7/25/20.
//  Copyright © 2020 Matthew Trump. All rights reserved.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var viewModel : StandardSetGame

    init(viewModel: StandardSetGame){
        self.viewModel = viewModel
        

    }
    func dealCards(_ number: Int){
        withAnimation(Animation.linear(duration: 0.8)){
             self.viewModel.dealCards(number)
        }
    }
    
    func getRandomOffscreenOffset() -> CGSize {
        let angle : Double = Double.random(in: 0..<(2 * Double.pi))
        return CGSize(width: offscreenRadius*cos(angle), height:offscreenRadius*sin(angle))
    }

    var body: some View {
        VStack{
            
            HStack{
                Button(action: {
                    if(self.viewModel.currentlyShowingMatch){
                        self.viewModel.replaceMatchedCards()
                    }else{
                        self.dealCards(3)
                    }
                }){
                    Text("deal more cards")
                }.disabled(!viewModel.hasCardsRemaining)
                  
                Text("Set Game").font(Font.largeTitle)
                Button(action: {
                        
                    self.viewModel.resetGame()
                    self.dealCards(self.initialNumberOfCards)
                    
                }){
                    Text("new game")
                }
            }
            
            Grid(viewModel.cards){card in
                CardView(card: card).onTapGesture{
                 
                    if(!card.wasMatched){
                            self.viewModel.choose(card:card)
                    }
                    
                }
                 .transition(AnyTransition.offset(self.getRandomOffscreenOffset()))
                 .animation(.easeOut(duration: 5))
                
                    
               
            }
            .padding()
            .onAppear{self.dealCards(self.initialNumberOfCards)}
            
            HStack{
                Text("Score: \(viewModel.score)")
              Button(action: {
                self.viewModel.cheat()
              }){
                   Text("cheat")
              }.disabled(viewModel.currentlyShowingMatch)
            }
       }
    }
    let initialNumberOfCards : Int = 12
    let offscreenRadius : Double = 1000.0
}


struct CardView: View {
    
    var card: SetGame.Card

    var body: some View {
        GeometryReader{geometry in
            self.body(for: geometry.size)
        }
    }

    @ViewBuilder
    private func body(for size: CGSize) -> some View{
        Group{
            VStack{
                ForEach(0..<card.number){_ in
                   
                    CardSymbol(card: self.card)
                }.frame(width: min(size.width, size.height*cardAspectRatio) * shapeWidthScale, height: min(size.height,size.width/cardAspectRatio)/shapeHeightScale)
            }
        }
        .cardify(isFaceUp: true,
                 isSelected: self.card.isSelected,
                 wasMatched: self.card.wasMatched,
                 isMismatched: self.card.isMismatched,
                 aspectRatio: cardAspectRatio)
        .padding(3)
    }

    
    private func fontSize(for size: CGSize) -> CGFloat{
        min(size.width, size.height)*0.7
    }
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 2
    private let shapeWidthScale : CGFloat = 0.5
    private let shapeHeightScale : CGFloat = 6
    private let cardAspectRatio  : CGFloat = 2/3
    private let shapeLineWidth : CGFloat = 2
    private let barCornerRadius : CGFloat = 20
    private let stripeLineWidth : CGFloat = 1
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let standardSetGame = StandardSetGame()
        return SetGameView(viewModel: standardSetGame)
    }
}


