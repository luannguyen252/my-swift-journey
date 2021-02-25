//
//  Curve_CurveBelowThenAbove.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 1/17/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Curve_CurveBelowThenAbove: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            Color("Background3").edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                TitleText("Custom Timing Curve")
                SubtitleText("Curve Below & Above")
                BannerText("The view BACKUP and then go BEYOND its destination.", backColor: Color("Secondary3"), textColor: Color("Foreground3"))
                    .fixedSize(horizontal: false, vertical: true)
                
                Image("BezierCoordinates5")
                
                Spacer()
                
                HStack {
                    HStack(spacing: 30) {
                        Button(action: {}) { Image(systemName: "wand.and.rays.inverse") }
                            .padding(.leading, 40)
                        Button(action: {}) { Image(systemName: "dial.fill") }
                        Button(action: {}) { Image(systemName: "paintbrush.fill") }
                        Button(action: {}) { Image(systemName: "bandage.fill") }
                        Button(action: {
                            self.show.toggle()
                        }) { Image(systemName: "line.horizontal.3.decrease") }
                            .rotationEffect(.degrees(-90))
                            .offset(x: 10)
                    }
                    .font(.largeTitle)
                    .padding(30)
                    .background(Capsule().fill(Color("Secondary3")))
                    .offset(x: self.show ? -60 : -340)
                    .animation(.timingCurve(0.5, -0.5, 0.5, 1.5, duration: 0.8))
                    
                    Spacer()
                }
                
                Spacer()
            }
            .font(.title)
            .accentColor(Color("Accent3"))
        }
    }
}

struct Curve_CurveBelowThenAbove_Previews: PreviewProvider {
    static var previews: some View {
        Curve_CurveBelowThenAbove()
    }
}
