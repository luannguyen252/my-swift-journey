//
//  GameUI-AnswerButton.swift
//  Created by Julian Schiavo on 13/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

extension GameUI {
    struct AnswerButton: View {
        var action: () -> Void
        
        public var body: some View {
            Button(action: {
                self.action()
            }, label: {
                submitLabel
            })
            .buttonStyle(PlainButtonStyle())
        }
        
        private var submitLabel: some View {
            Text("Submit")
                .foregroundColor(Presets.secondaryTextColor)
                .font(Presets.answerFieldFont)
                .padding(15)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.5), radius: 3)
        }
    }
}
