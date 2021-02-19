//
//  GameUI.swift
//  Created by Julian Schiavo on 8/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import Combine
import SwiftUI

/// The main GameUI View, used to display the HUD at the top and bottom of the screen
struct GameUI: View {
    
    /// Presets used by the GameUI elements
    enum Presets {
        static let largeTitleFont = Font.system(.title, design: .rounded).weight(.heavy)
        static let largeImageFont = Font.system(.title, design: .rounded).weight(.medium)
        static let headlineMediumFont = headlineFont.weight(.medium)
        static let headlineFont = Font.system(.headline, design: .rounded)
        static let answerFieldFont = Font.system(.title, design: .default).weight(.bold)
        
        static let secondaryTextColor = Color(red: 235 / 255, green: 235 / 255, blue: 245 / 255)
    }
    
    @ObservedObject private var engine = GameEngine.current
    
    private var clue: Clue { engine.currentClue }
    
    var submitAction: () -> Void
    var resetAction: () -> Void
    
    // State variables for which UI elements are currently shown
    @State private var hintTapCount = 0
    @State private var isHintAlertShown = false
    @State private var isSkipAlertShown = false
    @State private var isResetAlertShown = false
    
    private let topTransition = AnyTransition.move(edge: .top)
    private let bottomTransition = AnyTransition.move(edge: .bottom)
    
    public var body: some View {
        VStack(spacing: 10) {
            if engine.state != .finished {
                topUI
            }
            Spacer()
            if engine.state == .playing {
                bottomUI
            }
        }
        .padding(20)
    }
    
    private var topUI: some View {
        HStack(alignment: .top, spacing: 10) {
            if engine.message != nil && engine.state == .playing {
                MessageLabel(text: engine.message ?? "")
                    .transition(topTransition)
            }
            Spacer()
//            resetButton // The reset button is disabled as it is not useful
        }
    }
    
    private var bottomUI: some View {
        VStack(spacing: 10) {
            HStack(alignment: .bottom, spacing: 10) {
                LargeLabel(text: "Part \(engine.clueNumber)/\(engine.clueCount)")
                Spacer()
                hintButton
                skipButton
            }
            if clue.answerType != .none {
                if clue.answerType == .custom {
                    answerButton
                } else {
                    answerField
                }
            }
        }.transition(bottomTransition)
    }
    
    private var answerButton: some View {
        AnswerButton(action: submitAction)
    }
    
    private var answerField: some View {
        AnswerField(title: "Answer", text: $engine.currentAnswer, action: submitAction)
            .transition(bottomTransition)
    }
    
    private var hintButton: some View {
        CustomButton(image: Image(systemName: "questionmark")) {
            self.hintTapCount += 1
            if self.hintTapCount > 1, self.clue.supportsAdditionalHelp {
                self.engine.showAdditionalHelp()
            }
            
            self.isHintAlertShown.toggle()
        }
            .alert(isPresented: $isHintAlertShown) {
                var title = "Hint"
                var message = clue.hint
                if self.hintTapCount > 1, self.clue.supportsAdditionalHelp {
                    title = "Are you stuck?"
                    message = "Here's some extra help to get you going."
                }
                return Alert(title: Text(title), message: Text(message))
            }
    }
    
    private var skipButton: some View {
        CustomButton(title: "Skip") {
            self.isSkipAlertShown.toggle()
        }
        .alert(isPresented: $isSkipAlertShown) {
            let title = "Skip Part \(engine.clueNumber)?"
            let message = "If you're stuck, try use a hint first by tapping the question mark."
            
            let skipButton = Alert.Button.destructive(Text("Skip")) {
                GameEngine.current.nextScene()
            }
            let cancelButton = Alert.Button.cancel()
            
            return Alert(title: Text(title), message: Text(message), primaryButton: skipButton, secondaryButton: cancelButton)
        }
    }
    
    private var resetButton: some View {
        CustomButton(image: Image(systemName: "arrow.counterclockwise")) {
            self.isResetAlertShown.toggle()
        }
            .alert(isPresented: $isResetAlertShown) {
                let title = "Reset AR?"
                let message = "This will reset the AR object position, but not the state of the clue or the game."
                
                let resetButton = Alert.Button.destructive(Text("Reset")) {
                    self.resetAction()
                }
                let cancelButton = Alert.Button.cancel()
                
                return Alert(title: Text(title), message: Text(message), primaryButton: resetButton, secondaryButton: cancelButton)
            }
    }
}
