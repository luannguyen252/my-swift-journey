//
//  Radial_CustomCenter.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/20/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Radial_CustomCenter: View {
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.white, Color("Theme5BackgroundColor")]), center: UnitPoint(x: 0.5, y: 0.2),
                           startRadius: 10, endRadius: 420)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Rectangle()
                    .fill(RadialGradient(gradient: Gradient(colors: [.white, Color("Theme5DarkAccentColor")]), center: .bottomTrailing,
                                         startRadius: 0, endRadius: 15))
                    .frame(width: 50, height: 50)
                    .rotationEffect(.degrees(45))
                    .shadow(color: .gray, radius: 20, x: 0, y: 20)
                    .padding(30)
                
                Text("RadialGradient").font(.largeTitle)
                Text("As Background").foregroundColor(.gray)
                Text("You can also customize the center point by using the UnitPoint initializer to set the X and Y values. The values range from 0 to 1 and are relative to the size of the parent container. Think of them as percentages where 0.5 would be 50% of the width or height of the parent. In this example the center is 50% of the width and down 20% of the height.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Theme5DarkAccentColor"))
                    .foregroundColor(.white)
                Spacer()
            }
            .foregroundColor(Color("Theme5DarkShadeColor"))
            .font(.title)
            .minimumScaleFactor(0.5)
        }
    }
}

struct Radial_CustomCenter_Previews: PreviewProvider {
    static var previews: some View {
        Radial_CustomCenter()
    }
}
