//
//  HighPriorityGesture_Intro.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/3/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct HighPriorityGesture_Before: View {
    @State private var alternateBackground = false
    @State private var alternateCircleColor = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Gestures").font(.largeTitle).foregroundColor(.white)
                .padding(.top, 15)
            Text("High Priority Gesture - Before").foregroundColor(.gray)
            Text("Here is a scenario where you have two gestures. You can double-tap the background or the circle. They work independently of each other.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("Theme4ForegroundColor"))
            
            Circle()
                .fill(alternateCircleColor ? Color("Theme4LightAccentColor") : Color("Theme4ForegroundColor"))
                .frame(width: 200, height: 200)
                .overlay(Text("Double-Tap"))
                .onTapGesture(count: 2) { // This gesture works
                    self.alternateCircleColor.toggle()
            }
            
            Spacer()
            Text("Double-Tap")
                .foregroundColor(.white)
            Spacer()
        }
        .font(.title)
        .background(alternateBackground ? Color("Theme4AccentColor") : Color("Theme4BackgroundColor"))
        .onTapGesture(count: 2, perform: { // This gesture works
            self.alternateBackground.toggle()
        })
        .ignoresSafeArea()
    }
}

struct HighPriorityGesture_Before_Previews: PreviewProvider {
    static var previews: some View {
        HighPriorityGesture_Before()
    }
}
