//
//  Radial_EndRadius.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/20/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Radial_EndRadius: View {
    @State private var endRadius: CGFloat = 200.0
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.white, Color("Theme5BackgroundColor")]),
                           center: UnitPoint.center,
                           startRadius: 10,
                           endRadius: endRadius)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("RadialGradient").font(.largeTitle)
                Text("End Radius").foregroundColor(.gray)
                Text("The end radius determines the distance of the gradient from the start radius.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Theme5DarkAccentColor"))
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("End Radius: \(Int(endRadius))")
                HStack {
                    Text("50")
                    Slider(value: $endRadius, in: 50...400)
                    Text("400")
                }.padding()
            }
            .foregroundColor(Color("Theme5DarkShadeColor"))
            .font(.title)
        }
    }
}

struct Radial_EndRadius_Previews: PreviewProvider {
    static var previews: some View {
        Radial_EndRadius()
    }
}
