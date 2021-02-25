//
//  Transition_Slide.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/18/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Transition_Slide: View {
    @State private var showLogin = false
    @State private var userName = ""
    @State private var password = ""
    
    let xOffset: CGFloat = -200
    let showLoginDuration: Double = 0.7
    let delay = 0.5
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .edgesIgnoringSafeArea(.vertical)
            
            VStack(spacing: 20) {
                Text("Transitions")
                    .foregroundColor(Color("DarkAccent2"))
                    .font(Font.custom("DIN Condensed Bold", size: 70))
                Text("Slide").foregroundColor(.gray)
                
                Spacer()
                
                if showLogin {
                    VStack(spacing: 30) {
                        Image(systemName: "lock.shield")
                            .font(.system(size: 70))
                            .padding()
                            .foregroundColor(Color("Gold"))
                            .animation(Animation.easeOut(duration: showLoginDuration).delay(delay))
                        TextField("Username", text: self.$userName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .animation(Animation.easeOut(duration: showLoginDuration).delay(delay+0.3))
                        SecureField("Password", text: self.$password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .animation(Animation.easeOut(duration: showLoginDuration).delay(delay+0.5))
                        Button("Login", action: { }).foregroundColor(Color("Accent2"))
                            .animation(Animation.easeOut(duration: showLoginDuration).delay(delay+0.7))
                    }
                    .padding(.horizontal)
                    .transition(.slide)
                }
                
                Spacer()
                Spacer()
            }
            .font(.title)
            .onAppear {
                self.showLogin = true
            }
        }
    }
}

struct Transition_Slide_Previews: PreviewProvider {
    static var previews: some View {
        Transition_Slide()
    }
}
