//
//  ContentView.swift
//  Edutaintment
//
//  Created by Sandesh on 28/03/20.
//  Copyright © 2020 Sandesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var restartGame: Bool = false
    @State private var table: Int?
    @State private var numberOfQuestions: Int?
    
    var body: some View {
        return ZStack {
            LinearGradient(gradient: Gradient(colors: [.orange,.red]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))
                .edgesIgnoringSafeArea(.all)
            
                if table == nil {
                    VStack(spacing: 20) {
                        Text("Select table")
                            .font(.system(size: 45, weight: .medium, design: .rounded))
                            .foregroundColor(.yellow)
                        TableListView(selectedTable: $table)
                    }
                    .transition(.scale)
                } else  if numberOfQuestions == nil {
                    VStack(spacing: 24) {
                        Text("Select number of Questions")
                            .multilineTextAlignment(.center)
                            .lineLimit(0)
                            .font(.system(size: 30, weight: .medium, design: .rounded))
                            .foregroundColor(.yellow)
                        
                        VStack(spacing: 8) {
                            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                                Button(action: {
                                    withAnimation {
                                        self.numberOfQuestions = 5 * (item+1)
                                    }
                                }
                                ) {
                                    Text("\(5 * (item+1))")
                                        .font(.system(.title))
                                        .foregroundColor(.red)
                                        .padding()
                                        .frame(width: 150, height: 44)
                                        .background(Color.yellow)
                                        .clipShape(Capsule())
                                }
                            }
                        }
                    }
                    .transition(.asymmetric(insertion: .scale, removal: .scale))
                } else {
                    QuestionsView(table: $table, numberOfQuestions: $numberOfQuestions, questions: getQuestions())
            }
        }
        
    }
    
    private func getQuestions() -> [Question] {
        guard let table = table else {
            fatalError("table is nil")
        }
        
        guard let questionCount = numberOfQuestions else {
            fatalError("numberOfQuestions is nil")
        }
        
        var currentCount = 0
        var questions = [Question]()
        
        while currentCount < questionCount {
            let multiplier = Array(1...10).randomElement()!
            questions.append(Question(question: "\(table) x \(multiplier)",
                                      correctAnswer: "\(table * multiplier)"))
            currentCount += 1
        }
        
        return questions
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
