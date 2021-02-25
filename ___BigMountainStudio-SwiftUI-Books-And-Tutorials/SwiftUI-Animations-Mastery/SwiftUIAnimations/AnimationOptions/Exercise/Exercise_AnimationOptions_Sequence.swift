//
//  Exercise_AnimationOptions_Sequence.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Exercise_AnimationOptions_Sequence: View {
    @State private var showLogin = false
    @State private var userName = ""
    @State private var password = ""
    
    let xOffset: CGFloat = -200
    let duration: Double = 0.7
    let delay = 0.5
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                           center: .center, startRadius: 10, endRadius: 400)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Exercise").foregroundColor(Color("Gold"))
                    .font(Font.custom("DIN Condensed Bold", size: 70))
                Text("Show Login").foregroundColor(.gray)
                Spacer()
                VStack(spacing: 30) {
                    Image(systemName: "lock.shield")
                        .font(.system(size: 70))
                        .padding()
                        .foregroundColor(Color("Gold"))
                        .scaleEffect(showLogin ? 1 : 4)
                        .animation(Animation.easeIn(duration: duration/2).delay(delay))
                    TextField("Username", text: self.$userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .opacity(showLogin ? 1 : 0)
                        .offset(x: showLogin ? 0 : xOffset)
                        .animation(Animation.easeOut(duration: duration).delay(delay + 0.2))
                    SecureField("Password", text: self.$password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .opacity(showLogin ? 1 : 0)
                        .offset(x: showLogin ? 0 : xOffset)
                        .animation(Animation.easeOut(duration: duration).delay(delay + 0.4))
                    Button("Login", action: { })
                        .foregroundColor(Color("Accent"))
                        .opacity(showLogin ? 1 : 0)
                        .offset(x: showLogin ? 0 : xOffset)
                        .animation(Animation.easeOut(duration: duration).delay(delay + 0.6))
                }
                .padding(.horizontal)
                .onAppear {
                    self.showLogin = true
                }
                
                Spacer()
                Spacer()
            }
            .padding(.top)
            .font(.title)
        }
    }
}

struct Exercise_AnimationOptions_Sequence_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_AnimationOptions_Sequence()
    }
}
