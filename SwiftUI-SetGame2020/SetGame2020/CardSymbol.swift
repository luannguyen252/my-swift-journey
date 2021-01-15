//
//  CardSymbol.swift
//  Set Game
//
//  Created by Matthew Trump on 7/23/20.
//  Copyright © 2020 Matthew Trump. All rights reserved.
//

import SwiftUI

struct CardSymbol: View {
    
    let colors  : Dictionary<SetGame.CardColor,Color> = [SetGame.CardColor.red:Color.red,SetGame.CardColor.green:Color.green,SetGame.CardColor.blue:Color.blue]

    
    var card: SetGame.Card
    
    var body: some View{
    Group{
      if(self.card.shape==SetGame.CardShape.bar){
        if(self.card.shading==SetGame.CardShading.filled){
            RoundedRectangle(cornerRadius: barCornerRadius).fill()
        }else if(self.card.shading==SetGame.CardShading.striped){
            ZStack{
                Stripes(width: Int(stripeLineWidth)).stroke(lineWidth: stripeLineWidth).mask( RoundedRectangle(cornerRadius: barCornerRadius))
                RoundedRectangle(cornerRadius: barCornerRadius).stroke()
            }
   
        }else{
            RoundedRectangle(cornerRadius: barCornerRadius).stroke(lineWidth: shapeLineWidth)
        }
      }else if(self.card.shape==SetGame.CardShape.diamond){
        if(self.card.shading==SetGame.CardShading.filled){
           Diamond().fill()
        }else if(self.card.shading==SetGame.CardShading.striped){
           ZStack{
                Stripes(width: Int(stripeLineWidth)).stroke(lineWidth: stripeLineWidth).mask( Diamond())
                Diamond().stroke()
           }
        }else{
           Diamond().stroke(lineWidth: shapeLineWidth)
        }
      }else{
        if(self.card.shading==SetGame.CardShading.filled){
            Swerve().fill()
        }else if(self.card.shading==SetGame.CardShading.striped){
            ZStack{
                Stripes(width: Int(stripeLineWidth)).stroke(lineWidth: stripeLineWidth).mask( Swerve().fill())
                Swerve().stroke()
            }
           
        }else{
            Swerve().stroke(lineWidth: shapeLineWidth)
        }
      }
    }.foregroundColor(colors[card.color]!)
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
