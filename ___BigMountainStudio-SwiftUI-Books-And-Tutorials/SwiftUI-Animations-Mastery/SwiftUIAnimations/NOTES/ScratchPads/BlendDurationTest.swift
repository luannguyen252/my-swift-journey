//
//  BlendDurationTest.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/4/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct BlendDurationTest: View {
    @State private var change = false
    @State private var secondChange = false
    @State private var blendDuration = 1.0
    
    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .foregroundColor(.green)
                .scaleEffect(change ? secondChange ? 0.1 : 0.3 : secondChange ? 0.5 : 1.0)
                .animation(.spring(response: 1, dampingFraction: 0.1, blendDuration: 1), value: change)
                .animation(.spring(response: 10, dampingFraction: 1, blendDuration: 1), value: secondChange)
                .overlay(Text("Blend Duration: 1"))
            
            Circle()
                .foregroundColor(.green)
                .scaleEffect(change ? secondChange ? 0.1 : 0.3 : secondChange ? 0.5 : 1.0)
                .animation(.spring(response: 1, dampingFraction: 0.1, blendDuration: blendDuration), value: change)
                .animation(.spring(response: 10, dampingFraction: 1, blendDuration: blendDuration), value: secondChange)
            
            HStack {
                Image(systemName: "hare")
                Slider(value: $blendDuration, in: 0...2000)
                Image(systemName: "tortoise")
            }.foregroundColor(.green).padding()
            
            Text("\(self.blendDuration)")
            
            Button("Change") {
                withAnimation{
                    self.change.toggle()}
            }.font(.title)
            
            Button("SecondChange") {
                withAnimation{
                    self.secondChange.toggle()}
            }.font(.title)
        }
    }
}


struct BlendDurationTest_Previews: PreviewProvider {
    static var previews: some View {
        BlendDurationTest()
    }
}
