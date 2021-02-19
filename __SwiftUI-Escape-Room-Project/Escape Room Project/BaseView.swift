//
//  ContentView.swift
//  Created by Julian Schiavo on 7/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

public struct BaseView: View {
    
    @ObservedObject private var engine = GameEngine.current
    
    /// Whether the intro/title screen is currently shown
    @State private var isIntroScreenPresented = true
    
    public init() { }
    
    public var body: some View {
        var errorText: String?
        if case let .error(actualError) = engine.state {
            errorText = actualError
        }
        
        return ZStack {
            if engine.state == .loading {
                loading
            } else if errorText != nil {
                error(text: errorText)
            } else if engine.state == .selectingAccessibilityPreferences {
                accessibilityPreferences
            } else if engine.state == .heatWarning {
                heatWarning
            } else if isIntroScreenPresented {
                intro
            } else if engine.state == .outro {
                outro
            } else {
                game
            }
        }
    }
    
    private var game: some View {
        Game()
    }
    
    private var loading: some View {
        GameUI.Loading()
    }
    
    private func error(text: String?) -> some View {
        GameUI.Error(error: text ?? "")
    }
    
    private var accessibilityPreferences: some View {
        GameUI.AccessibilityPreferences()
    }
    
    private var heatWarning: some View {
        GameUI.HeatWarning()
    }
    
    private var intro: some View {
        Intro(isPresented: $isIntroScreenPresented)
            .edgesIgnoringSafeArea(.all)
    }
    
    private var outro: some View {
        Outro().edgesIgnoringSafeArea(.all)
    }
}
