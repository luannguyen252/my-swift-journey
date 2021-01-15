//
//  ManageSurveyViewModel.swift
//  SwiftUISurvey
//
//  Created by Amir on 07/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import Foundation

class ManageSurveyViewModel: ObservableObject {
    
    // MARK: Properties
    
    @Published var mode: ManageListMode = .surveys
    @Published var editingSurvey: Survey? = nil {
        didSet {
            isPresentingSurveyView = editingSurvey != nil
        }
    }
    @Published var editingQuestion: Question? = nil {
        didSet {
            isPresentingQuestionView = editingQuestion != nil
        }
    }
    @Published var isPresentingQuestionView: Bool = false
    @Published var isPresentingSurveyView: Bool = false
}
