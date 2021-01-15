//
//  SurveyListView.swift
//  SwiftUISurvey
//
//  Created by Amir on 07/06/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import SwiftUI

struct SurveyListView: View {
    
    @Binding var selectedSurvey: Survey?
    @StateObject var viewModel: SurveyListViewModel
    
    init(selectedSurvey: Binding<Survey?>? = nil) {
        _selectedSurvey = selectedSurvey ?? .fake(nil)
        _viewModel = StateObject(wrappedValue: SurveyListViewModel())
    }
    
    var body: some View {
        List(viewModel.surveys) { survey in
            SurveyRowView(survey: survey) {
                selectedSurvey = survey
            }
        }
        .listStyle(InsetGroupedListStyle())
        .onAppear(perform: viewModel.refresh)
    }
}

struct SurveyRowView: View {
    
    let survey: Survey
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(survey.title)
        }
    }
}
