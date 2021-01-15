//
//  CovidAnswerView.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 12.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import SwiftUI

struct CovidAnswerView: View {
    let questionModel: CovidFAQModel
    
    var body: some View {
        List {
            Section(header: Text(verbatim: "Question")) {
                Text(verbatim: questionModel.question)
            }
            Section(header: Text(verbatim: "Answer")) {
                Text(verbatim: questionModel.answer)
            }
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        .navigationBarTitle("FAQ")
    }
}
