//
//  QuestionListView.swift
//  SwiftUISurvey
//
//  Created by Amir on 03/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import SwiftUI

struct QuestionListView: View {
    
    @Binding var selectedQuestion: Question?
    @StateObject var viewModel: QuestionListViewModel

    init(selectedQuestion: Binding<Question?>? = nil, ids: [UUID]? = nil) {
        _selectedQuestion = selectedQuestion ?? .fake(nil)
        _viewModel = StateObject(wrappedValue: QuestionListViewModel(ids: ids))
    }
    
    var body: some View {
        List(viewModel.questions) { question in
            QuestionRowView(question: question) {
                selectedQuestion = question
            }
        }
        .listStyle(InsetGroupedListStyle())
        .onAppear(perform: viewModel.refresh)
    }
}

struct QuestionRowView: View {
    
    let question: Question
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(question.title)
        }
    }
}
