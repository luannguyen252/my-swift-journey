//
//  SurveyRepository.swift
//  SwiftUISurvey
//
//  Created by Amir on 02/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import Foundation
import Combine

class SurveyRepository: CombineEnabled {
    
    // MARK: Static properties
    
    static var shared = SurveyRepository(webAPI: WebAPI.shared)
    
    
    // MARK: Properties
    
    let cancellableBag = CancellableBag()
    
    @Published private(set) var isFetchingList: Bool = false
    @Published private(set) var surveys: [Survey] = []
    
    private let webAPI: SurveyWebAPI
    
    
    // MARK: Lifecycle
    
    init(webAPI: SurveyWebAPI) {
        self.webAPI = webAPI
        fetchSurveys()
    }
    
    
    // MARK: Public functions
    
    func fetchSurveys() {
        guard !isFetchingList else { return }
        webAPI
            .getSurveys()
            .sinkAndAssign(to: self, loading: \.isFetchingList, result: \.surveys)
        //TODO: add try on error
    }
    
    func addSurvey(survey: Survey) -> AnyPublisher<Survey, Error> {
        webAPI.post(survey: survey)
            .handleEvents(receiveOutput: { [weak self] in
                self?.add(survey: $0)
            })
            .eraseToAnyPublisher()
    }
    
    func editSurvey(survey: Survey) -> AnyPublisher<Survey, Error> {
        webAPI.put(survey: survey)
            .handleEvents(receiveOutput: { [weak self] in
                self?.replace(survey: $0)
            })
            .eraseToAnyPublisher()
    }
    
    
    // MARK: Private function
    
    private func add(survey: Survey) {
        surveys.append(survey)
    }
    
    private func replace(survey: Survey) {
        surveys = surveys.map { $0.id == survey.id ? survey : $0 }
    }
}
