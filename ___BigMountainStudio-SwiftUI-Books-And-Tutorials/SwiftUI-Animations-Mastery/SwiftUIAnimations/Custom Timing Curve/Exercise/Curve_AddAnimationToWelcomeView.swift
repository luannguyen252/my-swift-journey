//
//  Curve_AddAnimationToWelcomeView.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 1/26/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct WelcomeBackView: View {
    // This is what will connect to the main view's @State variable
    @Binding var showMenus: Bool
    
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
            
            Button(action: {
                self.showMenus.toggle()
            }) {
                Text("See Details")
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(ButtonStyleThinOutline())
            .padding()
        }
        .frame(width: 300, height: 600)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color("Secondary4")).shadow(radius: 8))
        .scaleEffect(showMenus ? 0.7 : 1)
        .blur(radius: showMenus ? 5 : 0)
        .animation(showMenus ?
            Animation.easeInOut(duration: 1).delay(0.1) :
            .timingCurve(0.5, 0, 0.5, 1.5, duration: 1))
    }
}

struct Curve_AddAnimationToWelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeBackView(showMenus: .constant(false))
    }
}
