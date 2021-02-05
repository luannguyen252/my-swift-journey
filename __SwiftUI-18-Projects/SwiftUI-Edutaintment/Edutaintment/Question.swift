//
//  Question.swift
//  Edutaintment
//
//  Created by Sandesh on 16/05/20.
//  Copyright © 2020 Sandesh. All rights reserved.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    var question: String
    var correctAnswer: String
    var userAnswer: String = ""
}

extension Question {
    static var testQuestion: Question {
        Question(question: "3 x 5", correctAnswer: "15")
    }
}
