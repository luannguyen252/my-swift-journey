//
//  ResultView.swift
//  MultiplicationTables-SwiftUI
//
//  Created by Mike Jarosch on 12/18/20.
//

import SwiftUI

struct ResultView: View {
    let title: String
    let question: Question
    let complete: () -> Void

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .opacity(0.5)
            
            VStack(spacing: 60) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("\(question.question) is \(question.answer)")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Button("Continue") {
                    complete()
                }
            }
            .frame(width: 300, height: 500)
            .background(Color(.systemBackground))
            .cornerRadius(8)
            .shadow(radius: 16)
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            ResultView(title: "Correct", question: TestQuestions.question) {
                
            }
        }
        ZStack {
            Color.blue
                .ignoresSafeArea()
            ResultView(title: "Wrong", question: TestQuestions.question) {
                
            }
        }
    }
}
