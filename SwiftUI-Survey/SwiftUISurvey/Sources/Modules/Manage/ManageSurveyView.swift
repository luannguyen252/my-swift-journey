//
//  ManageSurveyView.swift
//  SwiftUISurvey
//
//  Created by Amir on 07/06/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import SwiftUI

struct ManageSurveyView: View {
    
    @StateObject private var viewModel = ManageSurveyViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: AddEditSurveyView(isPresenting: $viewModel.isPresentingSurveyView,
                                                              survey: viewModel.editingSurvey),
                               isActive: $viewModel.isPresentingSurveyView) {}
                NavigationLink(destination: AddEditQuestionView(isPresenting: $viewModel.isPresentingQuestionView,
                                                                question: viewModel.editingQuestion),
                               isActive: $viewModel.isPresentingQuestionView) {}
                listView
                    .navigationBarItems(
                        leading: modePickerView,
                        trailing: addButton
                    )
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private var modePickerView: some View {
        Picker(selection: $viewModel.mode, label: Text("")) {
            ForEach(ManageListMode.allCases, id: \.self) {
                Text($0.name)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
    
    @ViewBuilder private var addButton: some View {
        Button(action: new) {
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 28, weight: .regular))
        }
    }
    
    @ViewBuilder private var listView: some View {
        switch viewModel.mode {
        case .surveys: SurveyListView(selectedSurvey: $viewModel.editingSurvey)
        case .questions: QuestionListView(selectedQuestion: $viewModel.editingQuestion)
        }
    }
    
    private func new() {
        viewModel.editingQuestion = nil
        viewModel.editingSurvey = nil
        switch viewModel.mode {
        case .surveys:
            viewModel.isPresentingSurveyView = true
        case .questions:
            viewModel.isPresentingQuestionView = true
        }
    }
}


struct ManageSurveyView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ManageSurveyView()
            ManageSurveyView()
                .environment(\.colorScheme, .dark)
        }
    }
}
