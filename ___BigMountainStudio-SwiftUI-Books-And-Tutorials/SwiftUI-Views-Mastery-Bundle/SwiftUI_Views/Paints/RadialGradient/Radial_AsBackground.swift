//
//  Radial_AsBackground.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/20/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Radial_AsBackground: View {
    var body: some View {
        ZStack {
            // Use radial gradient as background view
            RadialGradient(gradient: Gradient(colors: [.white, Color("Theme5BackgroundColor")]), center: UnitPoint.center, startRadius: 10, endRadius: 420)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("RadialGradient").font(.largeTitle)
                Text("As Background").foregroundColor(.gray)
                Text("The RadialGradient is a view that can live on its own. Here, it is used as the background.")
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

struct Radial_AsBackground_Previews: PreviewProvider {
    static var previews: some View {
        Radial_AsBackground()
    }
}
