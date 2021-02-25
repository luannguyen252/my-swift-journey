//
//  Curve_WelcomeScreen.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 1/26/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Curve_WelcomeScreen: View {
    private var backgroundGradient = LinearGradient(gradient: Gradient(colors: [Color("Background4"), Color("Secondary4")]), startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            backgroundGradient.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Workout Pro")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .padding(.top, 40)
                Spacer()
            }
            
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
        .font(.title)
        .foregroundColor(Color("Foreground4"))
    }
}

struct Curve_WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        Curve_WelcomeScreen()
    }
}


