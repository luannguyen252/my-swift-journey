//
//  QuestionsListModel.swift
//  WatchQuizApp WatchKit Extension
//
//  Created by Gualtiero Frigerio on 11/07/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import Combine
import SwiftUI

enum AnswerType {
    case correct
    case wrong
    case unanswered
}

class QuestionsListModel : ObservableObject {
    var willChange = PassthroughSubject<Void, Never>()
    var questions:[Question]
    var category:Category
    private var answers:[Int:AnswerType] = [:]
    
    init(category:Category) {
        self.category = category
        self.questions = category.questions
    }
    
    func getAnswer(forQuestionId id:Int) -> AnswerType {
        if let answer = answers[id] {
            return answer
        }
        return .unanswered
    }
    
    func getQuestion(id:Int) -> Question? {
        for question in questions {
            if question.id == id {
                return question
            }
        }
        return nil
    }
    
    func setAnswer(_ answer:String, forQuestionId id:Int) {
        willChange.send()
        for index in 0..<questions.count {
            if questions[index].id == id {
                let type:AnswerType = questions[index].correctAnswer == answer ? .correct : .wrong
                answers[id] = type
            }
        }
    }
}
