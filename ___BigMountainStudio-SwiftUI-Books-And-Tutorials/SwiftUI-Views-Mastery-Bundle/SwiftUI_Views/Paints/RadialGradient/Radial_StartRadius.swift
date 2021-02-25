//
//  Radial_StartRadius.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/20/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Radial_StartRadius: View {
    @State private var startRadius: CGFloat = 10.0
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.white, Color("Theme5BackgroundColor")]), center: UnitPoint.center, startRadius: startRadius, endRadius: 320)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("RadialGradient").font(.largeTitle)
                Text("Start Radius").foregroundColor(.gray)
                Text("Radius measures the distance from the center of a circle on outward. You set a startRadius to determine how far the first color should expand out from the center.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Theme5DarkAccentColor"))
                    .foregroundColor(.white)
                Spacer()
                Text("Start Radius: \(Int(startRadius))")
                HStack {
                    Text("0")
                    Slider(value: $startRadius, in: 0...250)
                    Text("250")
                }.padding()
            }
            .foregroundColor(Color("Theme5DarkShadeColor"))
            .font(.title)
        }
    }
}


struct Radial_StartRadius_Previews: PreviewProvider {
    static var previews: some View {
        Radial_StartRadius()
    }
}
