//
//  SelectView.swift
//  MultiplicationTables-SwiftUI
//
//  Created by Mike Jarosch on 10/30/20.
//

import SwiftUI

struct SelectView: View {
    let complete: ([Question]) -> Void

    @State private var factors: Int = 12
    @State private var numberOfQuestions: Int = 3
        
    private let numberOptions = ["5", "10", "20", "All"]

    var body: some View {
        Form {
            Section(header: Text("What would you like to practice?")) {
                Stepper(value: $factors, in: 1...12) {
                    Text("Practice up to \(factors)")
                }
            }
            
            Section(header: Text("How many questions would you like?")) {
                Picker("Number of Questions", selection: $numberOfQuestions) {
                    ForEach(0 ..< numberOptions.count) {
                        Text("\(self.numberOptions[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Button("Start") {
                let questions = Question.allQuestions
                    .filter { $0.factor1 <= factors || $0.factor2 <= factors }
                    .shuffled()
                    
                let trimmedQuestions: [Question] = {
                    switch numberOfQuestions {
                        case 0:
                            return Array(questions.prefix(5))
                        case 1:
                            return Array(questions.prefix(10))
                        case 2:
                            return Array(questions.prefix(20))
                        default:
                            return questions
                    }
                }()
                
                complete(Array(trimmedQuestions))
            }
        }
        .navigationBarTitle("Multiplication Tables")
    }
}

struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView() { (questions) in
            
        }
    }
}
