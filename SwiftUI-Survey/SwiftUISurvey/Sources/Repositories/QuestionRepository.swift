//
//  QuestionRepository.swift
//  SwiftUISurvey
//
//  Created by Amir on 02/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import Foundation
import Combine

class QuestionRepository: CombineEnabled {
    
    // MARK: Static properties
    
    static var shared = QuestionRepository(webAPI: WebAPI.shared)
    
    
    // MARK: Properties
    
    let cancellableBag = CancellableBag()
    
    @Published private(set) var isFetchingList: Bool = false
    @Published private(set) var questions: [Question] = []
    
    private let webAPI: SurveyWebAPI
    
    
    // MARK: Lifecycle
    
    init(webAPI: SurveyWebAPI) {
        self.webAPI = webAPI
        fetchQuestions()
    }
    
    
    // MARK: Public functions
    
    func fetchQuestions() {
        guard !isFetchingList else { return }
        webAPI
            .getQuestions()
            .sinkAndAssign(to: self, loading: \.isFetchingList, result: \.questions)
        //TODO: add try on error
    }
    
    func addQuestion(question: Question) -> AnyPublisher<Question, Error> {
        webAPI.post(question: question)
            .handleEvents(receiveOutput: { [weak self] in
                self?.add(question: $0)
            })
            .eraseToAnyPublisher()
    }
    
    func editQuestion(question: Question) -> AnyPublisher<Question, Error> {
        webAPI.put(question: question)
            .handleEvents(receiveOutput: { [weak self] in
                self?.replace(question: $0)
            })
            .eraseToAnyPublisher()
    }
    
    
    // MARK: Private function
    
    private func add(question: Question) {
        questions.append(question)
    }
    
    private func replace(question: Question) {
        questions = questions.map { $0.id == question.id ? question : $0 }
    }
}
