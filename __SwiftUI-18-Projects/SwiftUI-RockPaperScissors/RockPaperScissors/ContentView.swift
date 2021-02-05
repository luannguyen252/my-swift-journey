//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Sandesh on 14/03/20.
//  Copyright © 2020 Sandesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var showFinalScore = false
    @State private var computerScore = 0
    @State private var userScore = 0
    @State private var round = 0
    
    private let allItems = ["Rock", "Paper", "Scissor"]
    private let userOptions = ["Win", "Loose"]
    
    @State private var computerItem = ""
    @State private var userTaget = ""

    
    var body: some View {
        NavigationView {
            VStack( spacing: 16) {
                Spacer()

                Text(userTaget)
                    .frame(width: 300, height: 150, alignment: .center)
                    .background(userTaget == "Win" ? Color.green : Color.red)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                Spacer()
                HStack(spacing: 16) {
                    Spacer()
                    ItemButton(image: "rock") { self.userSelected("rock") }
                    Spacer()
                    ItemButton(image: "paper") { self.userSelected("paper") }
                    Spacer()
                    ItemButton(image: "scissor") { self.userSelected("scissor") }
                    Spacer()
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle("RockPaperScissor")
            .onAppear(perform: startGame)
        }
        .alert(isPresented: $showFinalScore) { () -> Alert in
            Alert(title: Text("Final score"), message: Text("Computer: \(computerScore) \n User: \(userScore)"), dismissButton: .default(Text("OK"), action: {
                self.startGame()
            }))
        }
    }
    
    func startGame() {
        computerScore = 0
        userScore = 0
        
        computerItem = allItems.randomElement()!
        userTaget = userOptions.randomElement()!
        
        round += 1
        
    }
    
    
    private func userSelected(_ item: String) {
        
        var userStatus = ""
        
        if item == "rock" {
            if computerItem == "Paper" {
                userStatus = "Loose"
            } else if computerItem == "Scissor" {
                 userStatus = "Win"
            } else {
                userStatus = "Draw"
            }
        }
        
        if item == "paper" {
            if computerItem == "Rock" {
                 userStatus = "Win"
            } else if computerItem == "Scissor" {
                userStatus = "Loose"
            } else {
                userStatus = "Draw"
            }
        }
        
        if item == "scissor" {
            if computerItem == "Paper" {
                 userStatus = "Win"
            } else if computerItem == "Rock" {
                userStatus = "Loose"
            } else {
                userStatus = "Draw"
            }
        }
        
        
        if userStatus == userTaget {
            userScore += 1
        } else {
            computerScore += 1
        }
        
        round += 1
        
        if round == 11 {
            showFinalScore = true
            return
        }
        
        userTaget = userOptions.randomElement()!
        computerItem = allItems.randomElement()!

    }
}

struct ItemButton: View {
    var image: String
    var action: () -> ()
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Image(image)
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
