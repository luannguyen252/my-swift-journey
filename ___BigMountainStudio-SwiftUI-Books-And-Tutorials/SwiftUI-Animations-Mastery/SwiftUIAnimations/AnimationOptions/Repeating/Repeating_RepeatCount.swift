//
//  Repeating_RepeatCount.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/19/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Repeating_RepeatCount: View {
    @State private var start = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Repeating")
            SubtitleText("Repeat Count")
            BannerText("You might want an animation to repeat only a certain number of times.", backColor: .green)
            
            Spacer()
            
            Button("Start", action: { self.start.toggle() })
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green, lineWidth: 4)
                        .scaleEffect(start ? 2 : 1)
                        .opacity(start ? 0 : 1))
                .animation(Animation.easeOut(duration: 0.6).repeatCount(3)) // Repeat 3 times
            
            Spacer()
            
        }
        .font(.title)
    }
}

struct Repeating_RepeatCount_Previews: PreviewProvider {
    static var previews: some View {
        Repeating_RepeatCount()
    }
}
