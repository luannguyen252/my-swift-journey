//
//  CovidFAQView.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 12.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import SwiftUI

struct CovidFAQView: View {
    
    @ObservedObject var viewModel = CovidFAQViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text(verbatim: "FAQ")) {
                    ForEach(viewModel.questions, id: \.self) { question in
                        NavigationLink(
                            destination: CovidAnswerView(questionModel: question)
                        ) {
                            Text(verbatim: question.question)
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .onAppear {
                self.viewModel.loadData.send(())
            }
            .navigationBarTitle("Covid-19 info")
        }
    }
}
