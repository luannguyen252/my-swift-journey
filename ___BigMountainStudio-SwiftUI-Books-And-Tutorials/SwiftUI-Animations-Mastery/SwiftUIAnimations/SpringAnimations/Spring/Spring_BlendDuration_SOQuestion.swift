//
//  Spring_BlendDuration_SOQuestion.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 9/30/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Spring_BlendDuration_SOQuestion: View {
    @State private var animateChange = false
    @State private var sideToSide = false
    @State private var upAndDown = false
    @State private var blendDuration = 1.0
    
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            
            Circle()
            .frame(width: 100, height: 100)
                .foregroundColor(.green)
                .offset(x: sideToSide ? 150 : -150, y: upAndDown ? 150 : -150)
                .animation(.spring(response: 0.5, dampingFraction: 1, blendDuration: blendDuration), value: sideToSide)
                .animation(.spring(response: 5, dampingFraction: 1, blendDuration: blendDuration), value: upAndDown)
            
            Spacer()
            
            HStack {
                Image(systemName: "hare")
                Slider(value: $blendDuration, in: 0...200)
                Image(systemName: "tortoise")
            }.foregroundColor(.green).padding()
            
            Text("\(self.blendDuration)")
            
            Button("Side To Side") {
                withAnimation{
                    self.sideToSide.toggle()}
            }.font(.title)
            
            Button("Up And Down") {
                withAnimation{
                    self.upAndDown.toggle()}
            }.font(.title)
        }
    }
}


struct Spring_BlendDuration_SOQuestion_Previews: PreviewProvider {
    static var previews: some View {
        Spring_BlendDuration_SOQuestion()
    }
}
