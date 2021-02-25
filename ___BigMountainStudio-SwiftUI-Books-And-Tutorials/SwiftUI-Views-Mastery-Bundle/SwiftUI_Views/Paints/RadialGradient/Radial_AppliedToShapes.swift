//
//  Radial_AppliedToShapes.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/20/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Radial_AppliedToShapes: View {
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.white, Color("Theme5BackgroundColor")]),
                           center: .center, startRadius: 10, endRadius: 420)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Rectangle()
                    .fill(RadialGradient(gradient: Gradient(colors: [.white, Color("Theme5DarkAccentColor")]),
                                         center: .bottomTrailing, startRadius: 0,
                                         endRadius: 15))
                    .frame(width: 80, height: 80)
                    .rotationEffect(.degrees(45))
                    .shadow(color: .gray, radius: 20, x: 0, y: 20)
                    .padding(30)
                
                Text("RadialGradient").font(.largeTitle)
                Text("Applied to Shapes").foregroundColor(.gray)
                Text("Like all gradients, radial gradients implement the ShapeStyle protocol. This means it can be applied to shapes using the fill modifier. A new radial gradient is applied to the rectangle above.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Theme5DarkAccentColor"))
                    .foregroundColor(.white)
                Spacer()
            }
            .foregroundColor(Color("Theme5DarkShadeColor"))
            .font(.title)
        }
    }
}

struct Radial_AppliedToShapes_Previews: PreviewProvider {
    static var previews: some View {
        Radial_AppliedToShapes()
    }
}
