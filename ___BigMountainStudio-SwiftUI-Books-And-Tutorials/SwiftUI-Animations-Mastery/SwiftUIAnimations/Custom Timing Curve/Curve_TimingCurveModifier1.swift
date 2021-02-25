//
//  Curve_Intro.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 1/10/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Curve_TimingCurveModifier1: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("Background3").edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                TitleText("Custom Timing Curve")
                SubtitleText("Introduction")
                BannerText("By defining the X & Y coordinates of the two Bézier handles of the curve, you can create a custom timing curve.", backColor: Color("Secondary3"), textColor: Color("Foreground3"))
                Image("BezierCoordinates1")
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
                    .animation(Animation.timingCurve(0.1, 0.7, 0.9, 0.3, duration: 1))
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

struct Curve_TimingCurveModifier1_Previews: PreviewProvider {
    static var previews: some View {
        Curve_TimingCurveModifier1()
    }
}
