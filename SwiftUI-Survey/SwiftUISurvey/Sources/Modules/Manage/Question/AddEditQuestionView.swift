//
//  AddEditQuestionView.swift
//  SwiftUISurvey
//
//  Created by Amir on 03/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import SwiftUI

struct AddEditQuestionView: View {
    
    @StateObject private var viewModel: AddEditQuestionViewModel
    
    init(isPresenting: Binding<Bool>, question: Question? = nil) {
        _viewModel = StateObject(
            wrappedValue: AddEditQuestionViewModel(isPresenting: isPresenting, question: question)
        )
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $viewModel.question.title)
                TextField("Question", text: $viewModel.question.question)
            }
            
            Section {
                Toggle(isOn: $viewModel.question.isOptional) {
                    Text("Optional")
                }
            }
            
            Section {
                ActionButton(title: "Save",
                             action: viewModel.save,
                             isBusy: viewModel.sendQuestionState.isInProgress,
                             isDisabled: !viewModel.canBeSaved)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        .navigationBarTitle(viewModel.isEditing ? "Edit Question" : "Add Question", displayMode: .inline)
        .showErrors(state: $viewModel.sendQuestionState)
    }
    
}


struct AddEditQuestionView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            view
            
            view
                .environment(\.colorScheme, .dark)
        }
    }
    
    private static var view: some View {
        AddEditQuestionView(isPresenting: .init(get: { true }, set: { _ in }))
    }
}
