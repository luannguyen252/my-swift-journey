//
//  Radial_CenterOfGradient.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/20/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Radial_CenterOfGradient: View {
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.white, Color("Theme5BackgroundColor")]), center: .leading,
                           startRadius: 10, endRadius: 420)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Rectangle()
                    .fill(RadialGradient(gradient: Gradient(colors: [.white, Color("Theme5DarkAccentColor")]), center: .bottomTrailing,
                                         startRadius: 0, endRadius: 15))
                    .frame(width: 80, height: 80)
                    .rotationEffect(.degrees(45))
                    .shadow(color: Color(UIColor.darkGray), radius: 20, x: 20, y: -10)
                    .padding(30)
                
                Text("RadialGradient").font(.largeTitle)
                Text("Center of Gradient").foregroundColor(Color(UIColor.darkGray))
                Text("You can move where the center point of the gradient is. It uses the UnitPoint type so you can easily adjust it.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Theme5DarkAccentColor"))
                    .foregroundColor(.white)
                
                HStack(spacing: 40) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("1. topLeading")
                        Text("2. top")
                        Text("3. topTrailing")
                        Text("4. leading")
                        Text("5. center")
                        Text("6. trailing")
                        Text("7. bottomLeading")
                        Text("8. bottom")
                        Text("9. bottomTrailing")
                    }
                    .font(.body)
                    
                    Image("Unit")
                }
                
                Spacer()
            }
            .foregroundColor(Color("Theme5DarkShadeColor"))
            .font(.title)
            .minimumScaleFactor(0.5)
        }
    }
}

struct Radial_CenterOfGradient_Previews: PreviewProvider {
    static var previews: some View {
        Radial_CenterOfGradient()
    }
}
