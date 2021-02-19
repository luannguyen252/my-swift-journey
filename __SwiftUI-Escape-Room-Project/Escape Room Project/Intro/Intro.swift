//
//  OnboardingView.swift
//  Created by Julian Schiavo on 7/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

struct Intro: View {
    
    /// Whether the view is currently presented
    @Binding var isPresented: Bool
    
    /// Whether the door opening animation is currently displayed
    /// This animation is shown before this screen is dismissed
    @State private var isShowingBackgroundAnimation = false
    
    public var body: some View {
        ZStack {
            if isShowingBackgroundAnimation {
                backgroundAnimation
            } else {
                introScreen
            }
        }
    }
    
    private var backgroundAnimation: some View {
        BackgroundAnimation {
            // After the background animation finishes, dismiss this screen, starting the game
            self.isPresented = false
        }
    }
    
    private var introScreen: some View {
        VStack(spacing: 60) {
            Spacer()
            introText
            playButton
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ThemeBackground())
    }
    
    private var introText: some View {
        VStack(spacing: 10) {
            Text("Escape DubDub")
                .layoutPriority(1)
                .font(.system(size: 62, weight: .black))
                .padding([.leading, .trailing], 20)
            Text("Escape from the AR escape room by solving clues you find around you in the real world, while learning about fundamental Computer Science concepts!")
                .font(.system(size: 22, design: .rounded))
                .frame(maxWidth: 600)
                .padding([.leading, .trailing], 30)
        }
        .lineLimit(nil)
            .foregroundColor(.white)
        .multilineTextAlignment(.center)
    }
    
    private var playButton: some View {
        ZStack {
            Spotlight()
                .layoutPriority(-1)
            PillButton(title: "Play") {
                self.isShowingBackgroundAnimation = true
            }
        }
    }
}
