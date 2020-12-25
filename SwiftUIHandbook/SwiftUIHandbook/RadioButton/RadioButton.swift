//
//  RadioButton.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 25/12/2020.
//

import SwiftUI

struct RadioButton: View {
    var questions: [String] = ["Yes", "No"]
    @Binding var selected: Int?
    var onSymbol = "largecircle.fill.circle"
    var offSymbol = "circle"
    var separator = " "
    
    var body: some View {
        Group {
            ForEach(questions.indices) { index in
                let tokens = questions[index].components(separatedBy: separator)
                let answer = tokens[0]
                let question = tokens.dropFirst().joined(separator: separator)
                
                Button(action: {
                    selected = selected == index && questions.count == 1 ? nil : index
                }, label: {
                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: selected == index  ? onSymbol : offSymbol)
                            .foregroundColor(.accentColor)
                        Group {
                            Text(answer)
                                .bold()
                            + Text(" \(question)")
                                .foregroundColor(Color(.label))
                        }.padding(.vertical, 2)
                    }
                })
            }
        }
    }
}
