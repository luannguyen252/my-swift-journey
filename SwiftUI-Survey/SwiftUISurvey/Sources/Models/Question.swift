//
//  Question.swift
//  SwiftUISurvey
//
//  Created by Amir on 02/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import Foundation

struct Question: Codable, Identifiable {
    
    // MARK: Properties
    
    var id: UUID
    var title: String
    var question: String
    var answerType: QuestionAnswerType
    var isOptional: Bool = false
}
