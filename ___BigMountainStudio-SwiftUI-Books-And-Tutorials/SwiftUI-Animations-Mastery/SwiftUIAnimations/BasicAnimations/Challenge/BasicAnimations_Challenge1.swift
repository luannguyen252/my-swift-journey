//
//  BasicAnimations_Challenge2.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct BasicAnimations_Challenge1: View {
    @State private var show = false
    @State private var userName = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            Color("ColorBackground")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                TitleText("Challenge")
                SubtitleText("Show Login")
                Spacer()
                Text("Already have an account?")
                Button("Login Now") {
                    self.show.toggle()
                }.font(.body)
                
                VStack(spacing: 20) {
                    Image(systemName: "lock.shield")
                    TextField("Username", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal)
                .animation(.default)
                .offset(x: show ? 0 : -500)
                
                Spacer()
                Spacer()
                
            }.font(.title)
        }
    }
}

struct BasicAnimations_Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimations_Challenge1()
    }
}
