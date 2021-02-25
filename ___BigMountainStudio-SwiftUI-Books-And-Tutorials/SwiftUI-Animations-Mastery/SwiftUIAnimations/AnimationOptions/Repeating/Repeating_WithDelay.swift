//
//  Repeating_WithDelay.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/2/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Repeating_WithDelay: View {
    @State private var start = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Repeating")
            SubtitleText("Repeat With Delay")
            BannerText("You can add a delay between each repeat of the animation. You want to add the delay modifier BEFORE the repeat modifier.", backColor: .green)
            
            Spacer()
            
            Button("Start", action: { self.start = true })
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green, lineWidth: 4)
                        .scaleEffect(start ? 2 : 0.9)
                        .opacity(start ? 0 : 1))
                .animation(Animation.easeOut(duration: 0.6)
                    .delay(1) // Add 1 second between animations
                    .repeatForever(autoreverses: false))
            
            Spacer()
            
        }
        .font(.title)
    }
}

struct Repeating_WithDelay_Previews: PreviewProvider {
    static var previews: some View {
        Repeating_WithDelay()
    }
}
