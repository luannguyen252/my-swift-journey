//
//  HighPriorityGesture_After.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/5/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct HighPriorityGesture_After: View {
    @State private var alternateBackground = false
    @State private var alternateCircleColor = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Gestures").font(.largeTitle).foregroundColor(.white).padding(.top, 15)
            Text("High Priority Gesture - After").foregroundColor(.gray)
            Text("The tap gesture on the circle no longer works because the gesture on the parent now has priority.")
                .frame(maxWidth: .infinity).padding()
                .background(Color("Theme4ForegroundColor"))
            
            Circle()
                .fill(alternateCircleColor ? Color("Theme4LightAccentColor") : Color("Theme4ForegroundColor"))
                .frame(width: 200, height: 200)
                .overlay(Text("Double-Tap"))
                .onTapGesture(count: 2) { // This gesture will be ignored now.
                    self.alternateCircleColor.toggle()
            }
            Spacer()
            Text("Double-Tap")
                .foregroundColor(.white)
            Spacer()
        }
        .font(.title)
        .background(alternateBackground ? Color("Theme4AccentColor") : Color("Theme4BackgroundColor"))
        .highPriorityGesture( // This gesture now takes priority over other gestures.
            TapGesture(count: 2)
                .onEnded({
                    self.alternateBackground.toggle()
                }))
        .ignoresSafeArea()
    }
}

struct HighPriorityGesture_After_Previews: PreviewProvider {
    static var previews: some View {
        HighPriorityGesture_After()
    }
}
