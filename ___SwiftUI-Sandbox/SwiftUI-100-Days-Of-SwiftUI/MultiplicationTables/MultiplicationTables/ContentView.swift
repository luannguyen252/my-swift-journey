//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Nicholas Fox on 12/28/19.
//  Copyright © 2019 Nicholas Fox. All rights reserved.
//

import SwiftUI


//
//class GameState {
//  var isConfiguring: Bool
//  var questions: [Question]
//  var currentQuestion: Int = 0
//  var score: Int = 0
//
//
//}


struct GameOptions {
  let difficulty: Difficulty
  let maxValue: Int
}



struct ContentView: View {


  @State private var isConfiguring = true
  @State private var questions: [Question] = []
  @State private var currentQuestionIndex: Int = 0
  private var currentQuestion: Question { return questions[currentQuestionIndex] }

  @State private var score: Int = 0

  @State private var isGameOver = false

  var body: some View {
    Group {
      if isConfiguring {
        StarterView(onStart: setupGame)
      } else {
        QuestionView(question: currentQuestion, onAnswer: checkAnswer)
      }
    }
    .alert(isPresented: $isGameOver) {
      Alert.init(
        title: Text("Game Over!"),
        message: Text("You got \(score) out of \(questions.count)"),
        dismissButton: .default(Text("OK"), action: { self.isConfiguring = true }))
    }
  }

  private func setupGame(options: GameOptions) {
    questions = generateQuestions(options: options)
    currentQuestionIndex = 0
    score = 0
    isConfiguring = false
  }

  private func checkAnswer(answer: String) {

    if answer == currentQuestion.answer {
      score += 1
    }

    currentQuestionIndex += 1
    if currentQuestionIndex == questions.count {
      isGameOver = true
    }
  }

  private func generateQuestions(options: GameOptions) -> [Question] {

    let value: Int
    switch options.difficulty {
    case .all:
      return generateAll(max: options.maxValue)
    case .five:
      value = 5
    case .ten:
      value = 10
    case .twenty:
      value = 20
    }

    return (0...value).map { _ in
      let first = Int.random(in: 1...options.maxValue)
      let second = Int.random(in: 1...options.maxValue)
      return Question(
        question: "What is \(first) * \(second)?",
        answer: "\(first * second)")
    }
  }

  private func generateAll(max: Int) -> [Question] {
    var questions = [Question]()
    (0...max).forEach { first in
      (0...max).forEach { second in
        questions.append(
          Question(
            question: "What is \(first) * \(second)?",
            answer: "\(first * second)"))
      }
    }
    return questions.shuffled()
  }
}


struct Question {
  let question: String
  let answer: String
}

extension Question {
  static let mock = Question(question: "What is 7 * 1?", answer: "7")
}


struct QuestionView: View {

  @State private var answer: String = ""
  let question: Question
  let onAnswer: (String) -> Void

  var body: some View {
    VStack(spacing: 8) {
      HStack {
        Text(question.question)
        Spacer()
      }
      TextField("Answer Here", text: $answer, onCommit: checkAnswer)
      Spacer()
      Button(action: checkAnswer) { Text("Submit") }
        .padding()
        .frame(minWidth: 120, minHeight: 50)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(8)
    }
    .padding()
  }

  private func checkAnswer() {
    onAnswer(answer)
  }
}



enum Difficulty: String, CaseIterable {
  case five
  case ten
  case twenty
  case all
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    //QuestionView(question: .mock)
  }
}
