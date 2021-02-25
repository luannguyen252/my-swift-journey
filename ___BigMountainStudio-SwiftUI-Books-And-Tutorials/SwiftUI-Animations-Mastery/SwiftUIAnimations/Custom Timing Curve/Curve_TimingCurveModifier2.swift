//
//  Curve_TimingCurveModifier2.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 1/17/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Curve_TimingCurveModifier2: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("Background3").edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                TitleText("Custom Timing Curve")
                SubtitleText("Another Example")
                BannerText("Here is how you would define a timing curve that's really fast at the beginning.", backColor: Color("Secondary3"), textColor: Color("Foreground3"))
                Image("BezierCoordinates2")
                Spacer()
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color("Tertiary3"))
                    .frame(width: 100, height: 100)
                    .overlay(Text("Linear"))
                    .offset(x: change ? 140 : -140, y: 0)
                    .animation(Animation.linear(duration: 1))
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color("Tertiary3"))
                    .frame(width: 100, height: 100)
                    .overlay(Text("Custom"))
                    .offset(x: change ? 140 : -140, y: 0)
                    .animation(Animation.timingCurve(0, 0.85, 0.15, 1, duration: 1))
                Spacer()
                Button("Change") {
                    self.change.toggle()
                }
            }
            .font(.title)
            .accentColor(Color("Accent3"))
        }
    }
}

struct Curve_TimingCurveModifier2_Previews: PreviewProvider {
    static var previews: some View {
        Curve_TimingCurveModifier2()
    }
}
