//
//  AddEditSurveyViewModel.swift
//  SwiftUISurvey
//
//  Created by Amir on 03/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class AddEditSurveyViewModel: ObservableObject, CombineEnabled {
    
    // MARK: Properties
    
    @Binding var isPresenting: Bool
    @Published var isSelectingQuestion: Bool = false
    @Published var sendSurveyState: PublisherState<Void, Error> = .idle
    @Published var isEditing: Bool = false
    @Published var survey: Survey
    @Published var selectedQuestion: Question? = nil {
        didSet {
            isSelectingQuestion = false
            guard let question = selectedQuestion, !survey.questionIds.contains(question.id) else { return }
            survey.questionIds.append(question.id)
        }
    }
    
    let cancellableBag = CancellableBag()
    
    var canBeSaved: Bool {
        !survey.title.isEmpty && !survey.questionIds.isEmpty
    }
    
    var questions: [Question] {
        questionRepository.questions.filter { [weak self] in
            self?.survey.questionIds.contains($0.id) ?? false
        }
    }
    
    private let surveyRepository: SurveyRepository
    private let questionRepository: QuestionRepository
    
    
    // MARK: Lifecycle
    
    init(isPresenting: Binding<Bool>,
         survey: Survey?,
         surveyRepository: SurveyRepository = .shared,
         questionRepository: QuestionRepository = .shared) {
        self.surveyRepository = surveyRepository
        self.questionRepository = questionRepository
        
        self.survey = survey ?? Survey(id: .init(), title: "", questionIds: [])
        isEditing = survey != nil
        
        _isPresenting = isPresenting
        $sendSurveyState
            .filter(\.isCompleted)
            .first()
            .map { _ in false }
            .sinkAndAssign(to: self, result: \.isPresenting)
        
    }
    
    
    // MARK: Public functions
    
    func deleteQuestion(at offsets: IndexSet) {
        survey.questionIds.remove(atOffsets: offsets)
    }
    
    func save() {
        let action = isEditing ?
            surveyRepository.editSurvey(survey: survey)
            :
            surveyRepository.addSurvey(survey: survey)
        
        action.eraseToVoidPublisher()
            .sinkAndAssign(to: self, state: \.sendSurveyState)
    }
}
