//
//  Cardify.swift
//  SetGame
//
//  Created by Matthew Trump on 7/14/20.
//  Copyright © 2020 Matthew Trump. All rights reserved.
//

import SwiftUI

struct SetCardify: AnimatableModifier{
    
    var isFaceUp: Bool
    var isSelected: Bool
    var wasMatched: Bool
    var isMismatched: Bool
    var aspectRatio: CGFloat

    var borderColor : Color {
        if(self.wasMatched){
            return Color.yellow
        }else if(self.isSelected){
            return Color.yellow
        }
        return Color.black
    }
    var cardColor : Color {
        if(self.wasMatched){
            return Color.green
        }else if(self.isMismatched){
            return Color.red
        }
        return Color.white
    }
    
    func body(content: Content) -> some View{
        ZStack{
            Group{
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(self.cardColor).opacity(self.isMismatched || self.wasMatched ? 0.2 : 1.0).animation(nil)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: self.isSelected ? 5: edgeLineWidth).foregroundColor(self.borderColor).animation(nil)
                          content
            }.opacity(isFaceUp ? 1 : 0)
            
            RoundedRectangle(cornerRadius: cornerRadius).fill(Color.orange)
                .opacity(isFaceUp ? 0 : 1)
            
            }.aspectRatio(self.aspectRatio, contentMode: .fit)
           
    }
    // MARK: Drawing Constants
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 1
}

extension View{
    func cardify(isFaceUp: Bool,
                 isSelected: Bool,
                 wasMatched: Bool,
                 isMismatched : Bool,
                 aspectRatio: CGFloat) -> some View{
        self.modifier(SetCardify(isFaceUp:isFaceUp,
                              isSelected:isSelected,
                              wasMatched:wasMatched,
                              isMismatched:isMismatched,
                              aspectRatio: aspectRatio))
    }
}
