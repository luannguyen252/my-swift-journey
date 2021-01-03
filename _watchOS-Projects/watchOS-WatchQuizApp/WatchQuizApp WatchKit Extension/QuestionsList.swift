//
//  QuestionsList.swift
//  WatchQuizApp WatchKit Extension
//
//  Created by Gualtiero Frigerio on 10/07/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import Combine
import SwiftUI

struct QuestionRow : View {
    var question:Question
    var currentAnswer:AnswerType = .unanswered
    
    var body : some View {
        VStack {
            HStack {
                Text(question.question).lineLimit(3)
                Spacer()
                if currentAnswer == .correct {
                    Image(systemName: "checkmark.seal")
                        .foregroundColor(.green)
                }
                else if currentAnswer == .wrong {
                    Image(systemName: "xmark.octagon.fill")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct QuestionsList : View {
    
    @State private var currentQuestionId = 0
    @State private var showAnswers = false
    @ObservedObject var model:QuestionsListModel
    
    var body: some View {
        List(model.questions, id:\.id) { question in
            Button(action: {
                self.showAnswers.toggle()
                self.currentQuestionId = question.id
            }) {
                QuestionRow(question: question, currentAnswer: self.model.getAnswer(forQuestionId: question.id))
            }
        }
        .navigationBarTitle(model.category.title)
        .actionSheet(isPresented: $showAnswers) { getActionSheetForQuestionId(currentQuestionId)}
        // At the moment showAnswers isn't set to false when the sheet
        // is dismissed via the cancel button on the top, so it takes
        // two taps to see the sheet again.
        // Tapping one of the buttons (.default or .cancel) resets the
        // variable to false
    }
}

extension QuestionsList {
    private func getActionSheetForQuestionId(_ questionId:Int) -> ActionSheet {
        var buttons:[ActionSheet.Button] = []
        guard let question = model.getQuestion(id:questionId) else {
            return ActionSheet(title: Text("Error"), message: Text("Couldn't find your question"), buttons: [.cancel()])
        }
        for answer in question.answers {
            buttons.append(.default(Text(answer), action: {
                self.checkAnswer(answer: answer, forQuestion: question)
            }))
            
        }
        return ActionSheet(title: Text(question.question), message: Text("Chose correct answer"), buttons: buttons)
    }
    
    private func checkAnswer(answer:String, forQuestion question:Question) {
        self.model.setAnswer(answer, forQuestionId: question.id)
    }
}

#if DEBUG
struct QuestionsList_Previews : PreviewProvider {
    static var previews: some View {
        QuestionsList(model:QuestionsListModel(category: DataSource().categories[0]))
    }
}
#endif
