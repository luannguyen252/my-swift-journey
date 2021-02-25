//
//  Curve_WelcomeBackView.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 1/26/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct WelcomeBackView_1: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome Back,")
                .fontWeight(.thin)
                .padding(.top)
            Text("Jaqueline")
                .fontWeight(.bold)
                .font(.largeTitle)
            Image("profile.female")
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
            
            Spacer()
            
            Button(action: { }) {
                Text("See Details")
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity)
            }
            .padding()
            .foregroundColor(Color.white)
            .background(RoundedRectangle(cornerRadius: 15).fill(Color("Accent4"))
            .opacity(0.1))
            .overlay(RoundedRectangle(cornerRadius: 15)
            .stroke(Color("Accent4"), lineWidth: 0.7))
            .padding()
        }
        .frame(width: 300, height: 600)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color("Secondary4")).shadow(radius: 8))
    }
}

struct Curve_WelcomeBackView_Previews: PreviewProvider {
    static var previews: some View {
        return WelcomeBackView_1()
    }
}
