//
//  Exercise_AnimationOptions_AnimateTextFieldsButton.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Exercise_AnimationOptions_AnimateTextFieldsButton: View {
    @State private var showLogin = false
    @State private var userName = ""
    @State private var password = ""
    
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
                        .animation(Animation.easeIn(duration: 0.5).delay(0.5))
                    TextField("Username", text: self.$userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .opacity(showLogin ? 1 : 0)
                        .offset(x: showLogin ? 0 : -200)
                        .animation(Animation.easeOut(duration: 0.5).delay(0.5))
                    SecureField("Password", text: self.$password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .opacity(showLogin ? 1 : 0)
                        .offset(x: showLogin ? 0 : -200)
                        .animation(Animation.easeOut(duration: 0.5).delay(0.5))
                    Button("Login", action: { })
                        .foregroundColor(Color("Accent"))
                        .opacity(showLogin ? 1 : 0)
                        .offset(x: showLogin ? 0 : -200)
                        .animation(Animation.easeOut(duration: 0.5).delay(0.5))
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

struct Exercise_AnimationOptions_AnimateTextFieldsButton_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_AnimationOptions_AnimateTextFieldsButton()
    }
}
