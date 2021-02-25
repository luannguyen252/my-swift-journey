//
//  Curve_Final.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 1/22/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Curve_Final: View {
    @State private var showMenus = false
    private var blurRadius: CGFloat = 4
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
            
            Group {
                VStack(spacing: 20) {
                    HStack(spacing: 20) {
                        VStack(spacing: 25) {
                            Text("Stats")
                                .fontWeight(.thin)
                                .padding()
                            Button(action: {}) { Image("stopwatch").foregroundColor(Color.white) }.buttonStyle(ButtonStyleThinOutline())
                            Button(action: {}) { Image("heart.rate").foregroundColor(Color.white) }.buttonStyle(ButtonStyleThinOutline())
                            Button(action: {}) { Image("scale").foregroundColor(Color.white) }.buttonStyle(ButtonStyleThinOutline())
                        }
                        .frame(maxWidth: .infinity, maxHeight: 500)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("Background4").opacity(0.95)).shadow(radius: 8))
                        .scaleEffect(showMenus ? 1 : 0.8)
                        .blur(radius: showMenus ? 0 : blurRadius)
                        .offset(x: showMenus ? 0 : -90)
                        .animation(showMenus ?
                            Animation.timingCurve(0, -2, 1, 0, duration: 1) :
                            .timingCurve(0, 1, 0, 1.5, duration: 1))
                        
                        VStack(spacing: 25) {
                            Text("Exercise")
                                .fontWeight(.thin)
                                .padding()
                            Button(action: {}) { Image("jump.rope").foregroundColor(Color.white) }.buttonStyle(ButtonStyleThinOutline())
                            Button(action: {}) { Image("dumbbell").foregroundColor(Color.white) }.buttonStyle(ButtonStyleThinOutline())
                            Button(action: {}) { Image("kettlebell").foregroundColor(Color.white) }.buttonStyle(ButtonStyleThinOutline())
                        }
                        .frame(maxWidth: .infinity, maxHeight: 500)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("Background4").opacity(0.95)).shadow(radius: 8))
                        .scaleEffect(showMenus ? 1 : 0.8)
                        .blur(radius: showMenus ? 0 : blurRadius)
                        .offset(x: showMenus ? 0 : 90)
                        .animation(showMenus ?
                            Animation.timingCurve(0, -2, 1, 0, duration: 1) :
                            .timingCurve(0, 1, 0, 1.5, duration: 1))
                    }
                    
                    Button(action: {
                        self.showMenus.toggle()
                    }) {
                        Text("Done")
                            .fontWeight(.light)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(ButtonStyleThinOutline())
                    .offset(y: showMenus ? 0 : 300)
                    .blur(radius: showMenus ? 0 : blurRadius)
                    .animation(.easeIn(duration: 1))
                }
                .padding(.horizontal)
                .zIndex(showMenus ? 1 : 0)
                
                
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
            }.offset(y: 50)
            
        }
        .font(.title)
        .foregroundColor(Color("Foreground4"))
    }
}

struct Curve_Final_Previews: PreviewProvider {
    static var previews: some View {
        Curve_Final()
    }
}
