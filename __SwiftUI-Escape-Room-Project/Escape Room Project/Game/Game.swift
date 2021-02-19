//
//  Game.swift
//  Created by Julian Schiavo on 8/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

struct Game: View {
    
    @ObservedObject private var engine = GameEngine.current
    
    /// Whether the alert showing the status of the player's answer is displayed
    @State var isAnswerAlertShown = false
    
    // The content for the alert telling the player whether there answer was correct
    @State var answerAlertTitle = ""
    @State var answerAlertDescription = ""
    
    public var body: some View {
        ZStack {
            arView
            if engine.state == .coaching {
                GameUI.DefaultCoachingExtra()
            } else if engine.state == .planeCoaching {
                GameUI.PlaneCoachingOverlay(isAccuratePlaneDetectionDisabled: $engine.isAccuratePlaneDetectionDisabled)
            }
            gameUI
            if engine.state == .showingEducationalContent {
                educationalContentBackground
                educationalContent
            }
        }
    }
    
    private var arView: some View {
        ARViewContainer()
            .edgesIgnoringSafeArea(.all)
            .alert(isPresented: $isAnswerAlertShown) { answerAlert }
    }
    
    private var gameUI: some View {
        GameUI(submitAction: submitButtonTapped, resetAction: resetGame)
    }
    
    private var educationalContent: some View {
        EducationalContentContainer(continueAction: self.toggleEducationalContent)
            .transition(.move(edge: .bottom))
    }
    
    private var educationalContentBackground: some View {
        Rectangle()
            .fill(Color.black.opacity(0.5))
            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .transition(.opacity)
    }
    
    private var answerAlert: Alert {
        Alert(title: Text(answerAlertTitle), message: Text(answerAlertDescription))
    }
    
    // MARK: - Game State Functions
    
    private func toggleEducationalContent() {
        engine.nextScene()
    }
    
    private func submitButtonTapped() {
        let answerAlertContent = engine.submitAnswer(engine.currentAnswer)
        answerAlertTitle = answerAlertContent.title
        answerAlertDescription = answerAlertContent.message
        isAnswerAlertShown = true
    }
    
    private func resetGame() {
        GameEngine.current.resetScene()
    }
}
