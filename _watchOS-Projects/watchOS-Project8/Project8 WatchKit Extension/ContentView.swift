//
//  ContentView.swift
//  Project8 WatchKit Extension
//
//  Created by Paul Hudson on 07/10/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var currentSafeValue = 50.0
    @State private var targetSafeValue = 0
    @State private var correctValues = [String]()
    @State private var allSafeNumbers = [Int]()

    @State private var title = "Safe Crack"

    @State private var currentTime = Date()
    @State private var startTime = Date()

    @State private var gameOver = false

    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()

    // MARK: - ANSWER COLOR
    var answerIsCorrect: Bool {
        Int(currentSafeValue) == targetSafeValue
    }
    
    var answerColor: Color {
        if answerIsCorrect {
            return .green
        } else {
            return .red
        }
    }

    // MARK: - TIME
    var time: String {
        let difference = currentTime.timeIntervalSince(startTime)
        return String(Int(difference))
    }

    // MARK: - BODY
    var body: some View {
        VStack {
            Text(title)
                .font(.title2)
                .foregroundColor(answerColor)

            Slider(value: $currentSafeValue, in: 1...100, step: 1)

            Button("Enter \(Int(currentSafeValue))", action: nextTapped)
                .disabled(answerIsCorrect == false)

            Text("Time: \(time)")
        }
        .onReceive(timer) { newTime in
            currentTime = newTime
        }
        .onAppear(perform: startNewGame)
        .alert(isPresented: $gameOver) {
            Alert(title: Text("You win!"), message: nil, dismissButton: .default(Text("Play Again"), action: startNewGame))
        }
    }

    // MARK: - NEXT TAPPED
    func nextTapped() {
        guard answerIsCorrect else { return }

        correctValues.append(String(targetSafeValue))
        title = correctValues.joined(separator: ", ")

        if correctValues.count == 4 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                gameOver = true
            }
        } else {
            pickNumber()
        }
    }

    // MARK: - START NEW GAME
    func startNewGame() {
        // Reset the timer
        startTime = Date()

        // Create an array of random numbers from 1 to 100
        allSafeNumbers = Array(1...100)
        allSafeNumbers.shuffle()

        // Reset the current value
        currentSafeValue = 50

        // Remove all their previous answers and reset the text
        correctValues.removeAll()

        // Pick the first number to guess
        pickNumber()
    }

    // MARK: - PICK NUMBER
    func pickNumber() {
        targetSafeValue = allSafeNumbers.removeFirst()
        print(targetSafeValue)
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
