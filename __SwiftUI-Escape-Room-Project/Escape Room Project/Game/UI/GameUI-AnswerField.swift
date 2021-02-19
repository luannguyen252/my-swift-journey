//
//  GameUI-AnswerField.swift
//  Created by Julian Schiavo on 11/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

extension GameUI {
    struct AnswerField: View {
        var title: String
        @Binding var text: String
        var action: () -> Void
        
        public var body: some View {
            HStack(spacing: 10) {
                textField
                submitButton
            }
            .background(Blur(style: .systemThinMaterial))
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.5), radius: 3)
        }
        
        private var textField: some View {
            TextField(title, text: $text)
                .foregroundColor(.white)
                .font(Presets.answerFieldFont)
                .padding(15)
                .environment(\.colorScheme, .dark)
        }
        
        private var submitButton: some View {
            Button(action: {
                self.action()
            }, label: { submitLabel })
                .buttonStyle(PlainButtonStyle())
                .background(Color.blue)
                .cornerRadius(10)
                .padding(10)
        }
        
        private var submitLabel: some View {
            Text("Submit")
                .foregroundColor(Presets.secondaryTextColor)
                .font(Presets.headlineFont)
                .padding(10)
        }
    }
}
