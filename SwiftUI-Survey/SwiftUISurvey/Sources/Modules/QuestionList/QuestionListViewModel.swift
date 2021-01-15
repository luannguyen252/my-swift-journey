//
//  QuestionListViewModel.swift
//  SwiftUISurvey
//
//  Created by Amir on 08/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import Foundation

class QuestionListViewModel: ObservableObject, CombineEnabled {
 
    // MARK: Properties
    
    @Published var questions: [Question] = []
    @Published var isRefreshing: Bool = false
    
    let cancellableBag = CancellableBag()
    private let questionRepository: QuestionRepository
    private let ids: [UUID]?
    
    // MARK: Lifecycle
    
    init(ids: [UUID]?, questionRepository: QuestionRepository = .shared) {
        self.ids = ids
        self.questionRepository = questionRepository
        questionRepository.$isFetchingList.sinkAndAssign(to: self, result: \.isRefreshing)
        questionRepository.$questions
            .map {
                if let ids = ids {
                    return $0.filter { ids.contains($0.id) }
                }
                return $0
            }
            .sinkAndAssign(to: self, result: \.questions)
    }
    
    
    // MARK: Public functions
    
    func refresh() {
        questionRepository.fetchQuestions()
    }
}
