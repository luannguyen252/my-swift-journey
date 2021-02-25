//
//  Animate_TwoModifiers.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/1/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Animate_TwoModifiers: View {
    @State private var change = false
    @State private var circleProgress: CGFloat = 0.25
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animatable Properties")
            SubtitleText("Two Modifiers")
            BannerText("You can animate multiple properties at the same time. Apple will interpolate the differences.", backColor: .blue, textColor: .white)
            
            Button("Change") {
                self.change.toggle()
                self.circleProgress = self.change ? 1 : 0.25
            }
            
            Spacer()
            
            Circle()
                .trim(from: 0, to: circleProgress) // Animate trim
                .stroke(change ? Color.blue : Color.orange,
                        style: StrokeStyle(lineWidth: 40,
                                           lineCap: CGLineCap.round))
                .frame(height: 300)
                .rotationEffect(.degrees(-90)) // Start from top
                .padding(40)
                .animation(.easeInOut(duration: 1))
            
            Spacer()
        }.font(.title)
    }
}

struct Animate_TwoModifiers_Previews: PreviewProvider {
    static var previews: some View {
        Animate_TwoModifiers()
    }
}
