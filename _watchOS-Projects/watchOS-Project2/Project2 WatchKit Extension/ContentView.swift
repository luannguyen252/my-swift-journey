//
//  ContentView.swift
//  Project2 WatchKit Extension
//
//  Created by Paul Hudson on 07/10/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var gameOver = false

    @State private var question = "rock"
    @State private var title = "Win!"

    @State private var shouldWin = true
    @State private var level = 1

    @State private var currentTime = Date()
    @State private var startTime = Date()

    // MARK: - TIMER
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()

    // MARK: - MOVES
    let moves = ["rock", "paper", "scissors"]

    // MARK: - TIME
    var time: String {
        let difference = currentTime.timeIntervalSince(startTime)
        return String(Int(difference))
    }

    // MARK: - BODY
    var body: some View {
        VStack {
            if gameOver {
                Text("You win!")
                    .font(.largeTitle)
                Text("Your time: \(time) seconds")

                Button("Play Again") {
                    startTime = Date()
                    gameOver = false
                    level = 1
                    newLevel()
                }
                .buttonStyle(BorderedButtonStyle(tint: .green))
            } else {
                Image(question)
                    .resizable()
                    .scaledToFit()

                Divider()
                    .padding(.vertical)

                HStack {
                    ForEach(moves, id: \.self) { type in
                        Button {
                            select(move: type)
                        } label: {
                            Image(type)
                                .resizable()
                                .scaledToFit()
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                } //: HSTACK

                HStack {
                    Text("\(level)/20")
                    Spacer()
                    Text("Time: \(time)")
                } //: HSTACK
                .padding([.top, .horizontal])
            }
        } //: VSTACK
        .navigationTitle(title)
        .onAppear(perform: newLevel)
        .onReceive(timer) { newTime in
            guard gameOver == false else { return }
            currentTime = newTime
        }
    }
    
    // MARK: - SELECT
    func select(move: String) {
        let solutions = [
            "rock": (win: "paper", lose: "scissors"),
            "paper": (win: "scissors", lose: "rock"),
            "scissors": (win: "rock", lose: "paper")
        ]

        guard let answer = solutions[question] else {
            fatalError("Unknown question: \(question)")
        }

        let isCorrect: Bool

        if shouldWin {
            isCorrect = move == answer.win
        } else {
            isCorrect = move == answer.lose
        }

        if isCorrect {
            level += 1
        } else {
            level -= 1
            if level < 1 { level = 1 }
        }

        newLevel()
    }
    
    // MARK: - NEW LEVEL
    func newLevel() {
        if level == 21 {
            gameOver = true
            return
        }

        if Bool.random() {
            title = "Win!"
            shouldWin = true
        } else {
            title = "Lose!"
            shouldWin = false
        }

        question = moves.randomElement()!
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
