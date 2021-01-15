//
//  SurveyListViewModel.swift
//  SwiftUISurvey
//
//  Created by Amir on 08/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import Foundation

class SurveyListViewModel: ObservableObject, CombineEnabled {
 
    // MARK: Properties
    
    @Published var surveys: [Survey] = []
    @Published var isRefreshing: Bool = false
    
    let cancellableBag = CancellableBag()
    private let surveyRepository: SurveyRepository
    
    
    // MARK: Lifecycle
    
    init(surveyRepository: SurveyRepository = .shared) {
        self.surveyRepository = surveyRepository
        surveyRepository.$isFetchingList.sinkAndAssign(to: self, result: \.isRefreshing)
        surveyRepository.$surveys.sinkAndAssign(to: self, result: \.surveys)
    }
    
    
    // MARK: Public functions
    
    func refresh() {
        surveyRepository.fetchSurveys()
    }
}
