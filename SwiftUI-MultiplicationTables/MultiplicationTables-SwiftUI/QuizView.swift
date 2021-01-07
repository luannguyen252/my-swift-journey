//
//  QuizView.swift
//  MultiplicationTables-SwiftUI
//
//  Created by Mike Jarosch on 10/30/20.
//

import SwiftUI

enum QuizState {
    case guessing
    case right
    case wrong
}

struct QuizView: View {
    let questions: [Question]
    let complete: (Int) -> Void

    @State private var quizState = QuizState.guessing
    @State private var currentQuestion = 0
    @State private var numberCorrect = 0
    @State private var guess = ""

    var body: some View {
        ZStack {
            Form {
                Text("What is \(questions[currentQuestion].question)?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                TextField("Answer", text: $guess)
                    .keyboardType(.numberPad)
                
                Button("Submit") {
                    guard let answer = Int(guess) else {
                        return
                    }
                    
                    if answer == questions[currentQuestion].answer {
                        numberCorrect += 1
                        quizState = .right
                    } else {
                        quizState = .wrong
                    }
                }
            }
            .blur(radius: quizState == .guessing ? 0 : -10)
            
            if quizState == .right {
                ResultView(title: "Correct", question: questions[currentQuestion], complete: resultComplete)
            }
            
            if quizState == .wrong {
                ResultView(title: "Wrong", question: questions[currentQuestion], complete: resultComplete)
            }
        }
    }
    
    func resultComplete() {
        if currentQuestion == questions.count - 1 {
            complete(numberCorrect)
        } else {
            currentQuestion += 1
            quizState = .guessing
            guess = ""
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(questions: Question.allQuestions) { (numberCorrect) in
            
        }
    }
}
