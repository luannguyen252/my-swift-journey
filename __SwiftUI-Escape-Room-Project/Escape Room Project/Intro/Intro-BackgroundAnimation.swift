//
//  BackgroundAnimation.swift
//  Created by Julian Schiavo on 8/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

struct BackgroundAnimation: View {
    
    var animationDidFinishHandler: () -> Void
    
    @State private var areDoorsOpen = false
    
    private let startingColor = Color(red: 44 / 255, green: 45 / 255, blue: 46 / 255) // #2C2D2E
    private let endingColor =   Color(red: 24 / 255, green: 24 / 255, blue: 25 / 255) // #181819
    
    public var body: some View {
        GeometryReader { proxy in
            self.body(screenWidth: proxy.size.width, screenHeight: proxy.size.height)
        }
    }
    
    private func body(screenWidth: CGFloat, screenHeight: CGFloat) -> some View {
        HStack(spacing: 0) {
            if !areDoorsOpen {
                door(edge: .leading)
            }
            Rectangle()
                .fill(Color.black)
                .frame(width: 2, height: screenHeight)
                .offset(x: screenWidth / 2, y: 0)
            if !areDoorsOpen {
                door(edge: .trailing)
            }
        }
        .onAppear {
            let animation = Animation.easeInOut(duration: 1)
            withAnimation(animation) {
                self.areDoorsOpen = true
            }
            DispatchQueue.runAfter(1, execute: self.animationDidFinishHandler)
        }
    }
    
    private func door(edge: Edge) -> some View {
        LinearGradient(gradient: Gradient(colors: [startingColor, endingColor]), startPoint: .top, endPoint: .bottom)
            .transition(.move(edge: edge))
    }
}
