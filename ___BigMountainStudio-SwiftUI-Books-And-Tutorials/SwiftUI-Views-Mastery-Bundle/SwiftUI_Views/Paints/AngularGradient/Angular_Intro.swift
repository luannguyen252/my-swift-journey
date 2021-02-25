//
//  Angular_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 7/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Angular_Intro : View {
    var body: some View {
        // Tip: For better blending, start and end the Gradient array with the same color.
        let gradient = Gradient(colors: [.pink, .purple, .pink])
        let angularGradient = AngularGradient(gradient: gradient, center: .center, angle: .degrees(0))
        let nonCenteredAngularGradient = AngularGradient(gradient: gradient, center: .bottomTrailing, angle: .degrees(0))
        
        return VStack(spacing: 20) {
            Text("Angular Gradient")
                .font(.largeTitle)
            
            Text("Introduction").font(.title).foregroundColor(.gray)
            
            Text("Angular gradients circle around a center point.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.purple).foregroundColor(Color.white)
                .font(.title)
            
            Rectangle()
                .fill(angularGradient)
            
            Text("The center point can be changed. Here, it is moved to the bottom trailing corner.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.purple).foregroundColor(Color.white)
                .font(.title).layoutPriority(1)
            
            Rectangle()
                .fill(nonCenteredAngularGradient)
        }
    }
}

struct Angular_Intro_Previews : PreviewProvider {
    static var previews: some View {
        Angular_Intro()
    }
}
