//
//  Exercise_Transition_Step1Transitions.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/23/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Exercise_Transition_Step1Transitions: View {
    @State private var step1 = true
    
    var body: some View {
        ZStack {
            Color("Background3")
            
            VStack(spacing: 60) {
                Spacer()
                
                if step1 {
                    Text("Ready to travel?")
                        .bold()
                        .foregroundColor(Color("Secondary3"))
                        .transition(AnyTransition.move(edge: .leading))
                        .animation(Animation.easeOut(duration: 1.1))
                }
                
                if step1 {
                    VStack(spacing: 60) {
                        Image("traveling")
                            .animation(Animation.easeIn(duration: 1))
                        
                        Capsule()
                            .fill(Color("Secondary3"))
                            .frame(height: 100)
                            .offset(x: -50)
                            .animation(Animation.easeInOut(duration: 0.6))
                            .overlay(Text("Let's go!")
                                .foregroundColor(Color("Foreground3"))
                                .animation(Animation.easeOut(duration: 0.6)))
                    }
                    .transition(.move(edge: .leading))
                }
                Spacer()
            }
            
            VStack {
                Spacer()
                HStack(spacing: 40) {
                    Button(action: {
                        self.step1.toggle()
                    }, label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .rotationEffect(.degrees(step1 ? 180 : 0))
                    })
                }
                .font(.system(size: 50))
                .animation(Animation.easeOut(duration: 1))
            }.padding(.bottom, 75)
        }
        .font(.largeTitle)
        .accentColor(Color("Accent3"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Exercise_Transition_Step1Transitions_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_Transition_Step1Transitions()
    }
}
