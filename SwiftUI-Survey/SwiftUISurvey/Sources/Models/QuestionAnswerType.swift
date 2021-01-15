//
//  QuestionAnswerType.swift
//  SwiftUISurvey
//
//  Created by Amir on 02/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import Foundation

enum QuestionAnswerType: Equatable {
    
    // MARK: Cases
    
    case yesNo
    case numeric
    case text
    case multiChoices([QuestionAnswerChoice])
    case singleChoice([QuestionAnswerChoice])
    case info
    case unknown
}


extension QuestionAnswerType: Codable {
    enum CodingKeys: String, CodingKey {
        case type
        case choices
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeRaw = try container.decode(String.self, forKey: .type)
        let choices = try container.decodeIfPresent([QuestionAnswerChoice].self, forKey: .choices)
        switch typeRaw {
        case "yesNo":
            self = .yesNo
        case "numeric":
            self = .numeric
        case "text":
            self = .text
        case "multiChoices":
            self = .multiChoices(choices!)
        case "singleChoice":
            self = .singleChoice(choices!)
        case "info":
            self = .info
        default:
            self = .unknown
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let typeRaw: String
        var choices: [QuestionAnswerChoice]?
        switch self {
        case .yesNo:
            typeRaw = "yesNo"
        case .numeric:
            typeRaw = "numeric"
        case .text:
            typeRaw = "text"
        case .multiChoices(let items):
            typeRaw = "multiChoices"
            choices = items
        case .singleChoice(let items):
            typeRaw = "singleChoice"
            choices = items
        case .info:
            typeRaw = "info"
        case .unknown:
            typeRaw = "unknown"
        }
        try container.encode(typeRaw, forKey: .type)
        if let choices = choices {
            try container.encode(choices, forKey: .choices)
        }
    }
    
}
