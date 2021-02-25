//
//  Curve_Menus.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 1/26/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct MenuViews: View {
    @Binding var showMenus: Bool
    var blurRadius: CGFloat = 4
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                VStack(spacing: 25) {
                    Text("Stats")
                        .fontWeight(.thin)
                        .padding()
                    Button(action: {}) { Image("stopwatch").foregroundColor(Color.white) }
                        .buttonStyle(ButtonStyleThinOutline())
                    Button(action: {}) { Image("heart.rate").foregroundColor(Color.white) }
                        .buttonStyle(ButtonStyleThinOutline())
                    Button(action: {}) { Image("scale").foregroundColor(Color.white) }
                        .buttonStyle(ButtonStyleThinOutline())
                }
                .frame(maxWidth: .infinity, maxHeight: 500)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("Background4")
                            .opacity(0.95))
                        .shadow(radius: 8))
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
                    Button(action: {}) { Image("jump.rope").foregroundColor(Color.white) }
                        .buttonStyle(ButtonStyleThinOutline())
                    Button(action: {}) { Image("dumbbell").foregroundColor(Color.white) }
                        .buttonStyle(ButtonStyleThinOutline())
                    Button(action: {}) { Image("kettlebell").foregroundColor(Color.white) }
                        .buttonStyle(ButtonStyleThinOutline())
                }
                .frame(maxWidth: .infinity, maxHeight: 500)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("Background4")
                            .opacity(0.95))
                        .shadow(radius: 8))
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
    }
}

struct Curve_Menus_Previews: PreviewProvider {
    static var previews: some View {
        MenuViews(showMenus: .constant(false))
    }
}
