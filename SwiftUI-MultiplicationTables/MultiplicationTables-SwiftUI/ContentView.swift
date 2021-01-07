//
//  ContentView.swift
//  MultiplicationTables-SwiftUI
//
//  Created by Mike Jarosch on 10/3/20.
//

import SwiftUI

enum Views {
    case select
    case quiz
    case result
}

struct ContentView: View {
    @State var questions: [Question] = []
    @State var numberCorrect = 0
    @State var currentView = Views.select
    
    var body: some View {
        NavigationView {
            switch currentView {
                case .select:
                SelectView() { (questions) in
                    self.questions = questions
                    currentView = .quiz
                }
            case .quiz:
                QuizView(questions: questions) { (numberCorrect) in
                    self.numberCorrect = numberCorrect
                    currentView = .result
                }
            case .result:
                VStack {
                    Text("You got \(numberCorrect) correct.")
                    Button("Try Again") {
                        currentView = .select
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
