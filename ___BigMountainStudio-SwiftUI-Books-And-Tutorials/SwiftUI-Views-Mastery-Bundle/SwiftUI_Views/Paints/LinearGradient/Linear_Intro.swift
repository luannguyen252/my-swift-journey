//
//  Linear_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 7/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Linear_Intro : View {
    let gradientColors = Gradient(colors: [Color.pink, Color.purple])
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: gradientColors,
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("LinearGradient")
                    .font(.largeTitle)
                
                Text("Introduction")
                    .foregroundColor(.white)
                
                Text("When creating a gradient, you can specify an array of colors and start and end points to establish the direction of the gradient.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.pink.shadow(radius: 10))
                    
            }.font(.title)
        }
    }
}

struct Linear_Intro_Previews : PreviewProvider {
    static var previews: some View {
        Linear_Intro()
    }
}
