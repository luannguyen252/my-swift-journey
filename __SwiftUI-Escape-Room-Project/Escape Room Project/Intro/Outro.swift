//
//  Outro.swift
//  Created by Julian Schiavo on 18/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

struct Outro: View {
    
    /// Whether the door closing animation is currently displayed
    /// This animation is shown before this screen is shown
    @State private var isShowingBackgroundAnimation = true
    
    /// Used to animate the outro text
    @State private var isShowingText = false
    
    public var body: some View {
        ZStack {
            if isShowingBackgroundAnimation {
                backgroundAnimation
            } else {
                outroScreen
                    .onAppear {
                        withAnimation(Animation.spring().delay(0.9)) {
                            self.isShowingText.toggle()
                        }
                    }
                    .transition(.slide)
            }
        }
    }
    
    private var backgroundAnimation: some View {
        OutroAnimation {
            self.isShowingBackgroundAnimation = false
        }
    }
    
    private var outroScreen: some View {
        VStack(alignment: .leading, spacing: 60) {
            Spacer()
            HStack {
                if isShowingText {
                    Text("thanks for playing!\nsee you online at dub dub :)\n\nmade by julian schiavo\nfollow me on twitter @_julianschiavo\ncheck out my blog at schiavo.me")
                        .font(.system(.title, design: .rounded))
                        .lineLimit(nil)
                        .foregroundColor(.white)
                }
                Spacer()
            }
        }
        .padding(60)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ThemeBackground())
    }
}
