//
//  AddEditQuestionViewModel.swift
//  SwiftUISurvey
//
//  Created by Amir on 03/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import SwiftUI
import Combine

class AddEditQuestionViewModel: ObservableObject, CombineEnabled {
    
    // MARK: Properties
    
    @Binding var isPresenting: Bool
    @Published var sendQuestionState: PublisherState<Void, Error> = .idle
    @Published var isEditing: Bool
    @Published var question: Question
    
    let cancellableBag = CancellableBag()
    
    var canBeSaved: Bool {
        !question.title.isEmpty && !question.question.isEmpty
    }
    
    private let questionRepository: QuestionRepository
    
    
    // MARK: Lifecycle
    
    init(isPresenting: Binding<Bool>,
         question: Question?,
         questionRepository: QuestionRepository = .shared) {
        self.questionRepository = questionRepository
        
        self.question = question ?? Question(id: .init(), title: "", question: "", answerType: .info)
        
        isEditing = question != nil
        
        _isPresenting = isPresenting
        $sendQuestionState
            .filter(\.isCompleted)
            .first()
            .map { _ in false }
            .sinkAndAssign(to: self, result: \.isPresenting)
    }
    
    
    // MARK: Public functions
    
    func save() {
        let action = isEditing ?
            questionRepository.editQuestion(question: question)
            :
            questionRepository.addQuestion(question: question)
        
        action.eraseToVoidPublisher()
            .sinkAndAssign(to: self, state: \.sendQuestionState)
    }
}
