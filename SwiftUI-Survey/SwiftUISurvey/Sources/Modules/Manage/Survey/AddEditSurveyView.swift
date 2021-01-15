//
//  AddEditSurveyView.swift
//  SwiftUISurvey
//
//  Created by Amir on 03/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import SwiftUI
import Combine

struct AddEditSurveyView: View {
    
    @StateObject private var viewModel: AddEditSurveyViewModel
    
    init(isPresenting: Binding<Bool>, survey: Survey? = nil) {
        _viewModel = StateObject(
            wrappedValue: AddEditSurveyViewModel(isPresenting: isPresenting, survey: survey)
        )
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $viewModel.survey.title)
            }
            
            Section(header: HStack {
                Text("Questions")
                    .foregroundColor(.gray)
                Spacer()
                NavigationLink(destination: QuestionListView(selectedQuestion: $viewModel.selectedQuestion),
                               isActive: $viewModel.isSelectingQuestion) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 20))
                }
            }
            .foregroundColor(.blue)) {
                ForEach(viewModel.questions) {
                    Text($0.title)
                }
                .onDelete(perform: viewModel.deleteQuestion)
                
                if viewModel.questions.isEmpty {
                    Text("No question added")
                        .foregroundColor(.gray)
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity)
                }
            }
            
            Section {
                ActionButton(title: "Save",
                             action: viewModel.save,
                             isBusy: viewModel.sendSurveyState.isInProgress,
                             isDisabled: !viewModel.canBeSaved)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        .navigationBarTitle(viewModel.isEditing ? "Edit Survey" : "Add Survey", displayMode: .inline)
        .showErrors(state: $viewModel.sendSurveyState)
    }
    
}

struct AddEditSurveyView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            view
            view.environment(\.colorScheme, .dark)
        }
    }
    
    private static var view: some View {
        AddEditSurveyView(isPresenting: .init(get: { true }, set: { _ in }))
    }
}
