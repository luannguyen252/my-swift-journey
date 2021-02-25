//
//  AnimationOptions_Challenge2.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct AnimationOptions_Challenge2: View {
    @State private var start = false
    @State private var pulse = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                TitleText("CHALLENGE").foregroundColor(Color("Gold"))
                SubtitleText("Recreate this Animation")
                
                Spacer()
                
                Text("Welcome!")
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundColor(Color("Gold"))
                    .opacity(start ? 1 : 0)
                    .animation(Animation.easeIn(duration: 1).delay(0.5))
                    .onAppear(perform: { self.start = true })
                
                Spacer()
                
                GeometryReader { geometry in
                    Button(action: {}) {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.system(size: 80))
                    }
                    .accentColor(Color("Accent"))
                    .overlay(
                        Circle()
                            .stroke(Color("Gold"), lineWidth: 5)
                            .opacity(self.start ? 0 : 1)
                            .scaleEffect(self.start ? 1.8 : 1.3)
                            .animation(Animation.easeOut(duration: 1).repeatCount(5).delay(2))
                    )
                        .rotationEffect(Angle.degrees(self.start ? 0 : -270))
                        .offset(x: self.start ? geometry.size.width / 3 : -geometry.size.width)
                        .animation(Animation.easeInOut(duration: 1).delay(1.5))
                }.frame(height: 100)
            }
            .font(.title)
        }
    }
}

struct AnimationOptions_Challenge2_Previews: PreviewProvider {
    static var previews: some View {
        AnimationOptions_Challenge2()
    }
}
