//
//  Exercise_Transition_Final.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/21/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Exercise_Transition_Final: View {
    @State private var step1 = true
    
    var body: some View {
        ZStack {
            Color("Background3")
            
            // Step 1
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
            
            // Step 2
            VStack(spacing: 5) {
                if step1 == false  {
                    Text("Where do you want to go?")
                        .bold()
                        .padding(.horizontal, 50)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("Secondary3"))
                        .transition(AnyTransition.move(edge: .top))
                        .animation(Animation.easeOut(duration: 0.8))
                }
                
                if step1 == false {
                    TripDetailsView()
                    .transition(.move(edge: .trailing))
                    .animation(Animation.easeIn(duration: 1))
                }
                
                if step1 == false {
                    Image("airplane")
                        .padding(.bottom, 100)
                        .transition(.move(edge: .bottom))
                        .animation(Animation.easeOut(duration: 0.8))
                }
            }.padding(.top, 40)
            
            // Buttons
            VStack {
                Spacer()
                HStack(spacing: 40) {
                    Button(action: {
                        self.step1.toggle()
                    }, label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .rotationEffect(.degrees(step1 ? 180 : 0))
                    })
                    
                    if step1 == false {
                        Button(action: {
                            self.step1.toggle()
                        }, label: {
                            Image(systemName: "chevron.right.circle.fill")
                        })
                            .transition(AnyTransition.move(edge: .trailing).combined(with: .opacity))
                    }
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

struct Exercise_Transition_Final_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_Transition_Final()
    }
}
