//
//  SurveyWebAPI.swift
//  SwiftUISurvey
//
//  Created by Amir on 01/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import Combine
import Foundation

protocol SurveyWebAPI {
    func getSurveys() -> AnyPublisher<[Survey], Error>
    func post(survey: Survey) -> AnyPublisher<Survey, Error>
    func put(survey: Survey) -> AnyPublisher<Survey, Error>
    func delete(surveyId: UUID) -> AnyPublisher<WebAPI.Empty, Error>
    
    func getQuestions() -> AnyPublisher<[Question], Error>
    func post(question: Question) -> AnyPublisher<Question, Error>
    func put(question: Question) -> AnyPublisher<Question, Error>
    func delete(questionId: UUID) -> AnyPublisher<WebAPI.Empty, Error>
}
