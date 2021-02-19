//
//  EducationalContent.swift
//  Created by Julian Schiavo on 14/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

/// A container for a clue's educational content, providing the default appearance and style
struct EducationalContentContainer: View {
    @ObservedObject private var engine = GameEngine.current
    
    var continueAction: () -> Void
    
    public var body: some View {
        GeometryReader { proxy in
            VStack {
                ScrollView {
                    self.engine.currentClue.educationalContent()
                }
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                self.continueButton
            }
            .padding(20)
            .frame(width: proxy.size.width * 0.7, height: proxy.size.height * 0.95)
            .background(Blur(style: .systemThinMaterial))
            .cornerRadius(25)
        }
    }
    
    private var continueButton: some View {
        Button(action: continueAction) {
            Text("Continue")
                .foregroundColor(.white)
                .font(.headline)
                .fontWeight(.bold)
                .padding(15)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
