//
//  Question.swift
//  MultiplicationTables-SwiftUI
//
//  Created by Mike Jarosch on 11/15/20.
//

import Foundation

struct Question {
    let factor1: Int
    let factor2: Int
    let question: String
    let answer: Int
    
    init(factor1: Int, factor2: Int) {
        self.factor1 = factor1
        self.factor2 = factor2
        self.question = "\(factor1) x \(factor2)"
        self.answer = factor1 * factor2
    }
    
    static var allQuestions: [Question] {
        var questions: [Question] = []
        for i in 1...12 {
            for j in 1...12 {
                let question = Question(factor1: i, factor2: j)
                questions.append(question)
            }
        }
        return questions
    }
}

struct TestQuestions {
    static let question = Question(factor1: 1, factor2: 2)
    static let questions = [Question(factor1: 1, factor2: 2)]
}
