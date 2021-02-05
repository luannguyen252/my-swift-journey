//
//  QuestionsView.swift
//  Edutaintment
//
//  Created by Sandesh on 17/05/20.
//  Copyright © 2020 Sandesh. All rights reserved.
//

import SwiftUI

struct QuestionsView: View {
    @Binding var table: Int?
    @Binding var numberOfQuestions: Int?
    @State var questions: [Question]
    
    @State private var questionCounter = 0
    @State private var userAnswer = ""
    
    @State private var showFinalScore = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text(questions[questionCounter].question)
                .font(.system(size: 60, weight: .bold, design: .rounded))
                .frame(maxWidth: .infinity)
            
            Text ("=")
                .font(.system(size: 60, weight: .bold, design: .rounded))
            
            TextField("Answer", text: $userAnswer)
                .font(.system(size: 60, weight: .bold, design: .rounded))
                .keyboardType(.numberPad)
                .padding([.leading,.trailing])
                .multilineTextAlignment(.center)
            
            Button(action: {
                self.questions[self.questionCounter].userAnswer = self.userAnswer
                withAnimation {
                    if self.questionCounter < self.questions.count - 1 {
                        self.userAnswer = ""
                        self.questionCounter += 1
                    } else {
                        self.showFinalScore = true
                    }
                }
            }) {
                Text("Next")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .clipShape(Capsule())
                    .frame(width: 200)
            }
            
            Spacer()
        }
        .alert(isPresented: $showFinalScore) { () -> Alert in
            Alert(title: Text("Your score \(getScore())"), message: Text("Keep praticing to get better"), dismissButton: .default(Text("Play Again"), action: {
                self.table = nil
                self.numberOfQuestions = nil
            }))
        }
    }
    
    func getScore() -> String {
        var score = 0
        questions.forEach { ques in
            if ques.correctAnswer == ques.userAnswer {
                score += 1
            }
        }
        
        return "\(score)/\(questions.count)"
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView(table: .constant(4), numberOfQuestions: .constant(5), questions: [Question.testQuestion])
    }
}
