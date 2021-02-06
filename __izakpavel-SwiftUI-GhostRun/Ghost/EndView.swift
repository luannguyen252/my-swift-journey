//
//  EndView.swift
//  Ghost
//
//  Created by Pavel Zak on 30/10/2020.
//

import SwiftUI

struct EndView: View {
    @ObservedObject var game = Game()
    
    var finalText: String {
        if (self.game.score==0) {
            return "You cannot rest in peace without candies."
        }
        else if (self.game.score<20) {
            return "You feel restless with only \(self.game.score) candies."
        }
        else if (self.game.score<50){
            return "You feel happy with \(self.game.score) candies but want more!"
        }
        else {
            return "You collected \(self.game.score) candies and conquered this game.\nYou may rest in peace now!"
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text(self.finalText)
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.white)
            Spacer()
            GhostView(ghost: self.game.ghost)
                .frame(width: 100, height: 150)
            Spacer()
            Button(action: {
                self.game.start()
            }){
                Text("Try again!")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .onAppear{
            if (self.game.score < 100) {
                withAnimation(.easeIn(duration: 0.7)) {
                    self.game.ghost.roar()
                }
            }
            else {
                withAnimation(.easeIn(duration: 0.7)) {
                    self.game.ghost.smile()
                }
            }
        }
    }
}

