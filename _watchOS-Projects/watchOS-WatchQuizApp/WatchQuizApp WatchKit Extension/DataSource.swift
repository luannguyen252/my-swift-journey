//
//  DataSource.swift
//  WatchQuizApp WatchKit Extension
//
//  Created by Gualtiero Frigerio on 10/07/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import Foundation

struct Category:Codable {
    var title:String
    var color:String
    var questions:[Question]
    
    mutating func addQuestion(_ question:Question) {
        questions.append(question)
    }
}

struct Question:Codable {
    var id:Int
    var category:String
    var question:String
    var answers:[String]
    var correctAnswer:String
}

class DataSource {
    
    var categories:[Category]
    var questions:[Question]
    
    init() {
        self.categories = []
        self.questions = []
        if let categoriesUrl = Bundle.main.url(forResource: "categories", withExtension: "json") {
            if let categories = getCategories(fromURL: categoriesUrl) {
                self.categories = categories
            }
        }
        if let url = Bundle.main.url(forResource: "questions", withExtension: "json") {
            if let questions = getQuestions(fromURL: url) {
                self.questions = questions
                if categories.count == 0 {
                    self.categories = createCategories(fromQuestions: questions)
                }
                else {
                    self.addQuestionsToCategories()
                }
            }
        }
    }
}

extension DataSource {
    
    private func addQuestionsToCategories() {
        for index in 0..<categories.count {
            for question in questions {
                if question.category == categories[index].title {
                    categories[index].addQuestion(question)
                }
            }
        }
    }
    
    private func createCategories(fromQuestions questions:[Question]) -> [Category] {
        var categories:[Category] = []
        for question in questions {
            let category = question.category
            var found = false
            for index in 0..<categories.count {
                if categories[index].title == category {
                    found = true
                    categories[index].addQuestion(question)
                    break
                }
            }
            if !found {
                categories.append(Category(title:category, color:"", questions: [question]))
            }
        }
        return categories
    }
    
    private func getCategories(fromURL url:URL) -> [Category]? {
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        let decoder = JSONDecoder()
        guard let categories = try? decoder.decode([Category].self, from: data) else {
            return nil
        }
        return categories
    }
    
    private func getQuestions(fromURL url:URL) -> [Question]? {
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        let decoder = JSONDecoder()
        guard let questions = try? decoder.decode([Question].self, from: data) else {
            return nil
        }
        return questions
    }
}
