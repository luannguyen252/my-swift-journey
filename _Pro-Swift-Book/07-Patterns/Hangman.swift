//
//  main.swift
//  Hangman
//
//  Created by Brian Sipple on 6/3/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation

let potentialWords = ["RHYTHM", "DASHBOARD", "HABERDASHERY"]

let wordToGuess = potentialWords.randomElement()!
var lettersGuessed: Set<Character> = Set()
var remainingGuesses = 8


func discoveredWordText() -> String {
    return wordToGuess.reduce("") { (accumulated, currentChar) -> String in
        if lettersGuessed.contains(currentChar) {
            return "\(accumulated) \(currentChar)"
        } else {
            return accumulated + " _"
        }
    }
}


func printCurrentProgress() {
    print("You have \(remainingGuesses) remaining guesses.")
    print("Your current solution is...\n\n\t\(discoveredWordText())\n")
}


func hasSolution() -> Bool {
    return wordToGuess.allSatisfy( { lettersGuessed.contains($0) })
}

func checkSolution() {
    if hasSolution() {
        print("Congratulations! You correctly guessed \"\(wordToGuess)\". You survived the hangman... for now.")
        exit(0)
    }
}


func runIteration() {
    checkSolution()
    printCurrentProgress()

    print("Enter a guess: ", terminator: "")
    
    if let guessedLetter = readLine()?.uppercased().first {
        if lettersGuessed.contains(guessedLetter) {
            print("You used that letter already!")
        } else {
            lettersGuessed.insert(guessedLetter)
            checkSolution()
        }
    }
}



print("Welcome to Hangman!")
print("Press a letter to guess, or Ctrl+D to quit")



while remainingGuesses > 0 {
    runIteration()
    remainingGuesses -= 1
}

print("Oops -- you died!. The full word was \"\(wordToGuess)\"")
