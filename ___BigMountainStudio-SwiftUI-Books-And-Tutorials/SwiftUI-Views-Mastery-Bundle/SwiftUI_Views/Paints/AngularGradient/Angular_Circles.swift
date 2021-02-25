//
//  Angular_Circles.swift
//  100Views
//
//  Created by Mark Moeykens on 7/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Angular_Circles : View {
    var body: some View {
        let gradient = Gradient(colors: [.pink, .purple, .pink])
        let angularGradient = AngularGradient(gradient: gradient, center: .center, angle: .degrees(0))
        
        return VStack(spacing: 20) {
            Text("Angular Gradient").font(.largeTitle)
            Text("With Circles").font(.title).foregroundColor(.gray)
            Text("You can fill circular shapes with gradients.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.purple).foregroundColor(Color.white)
                .font(.title)
            
            HStack {
                Circle().fill(angularGradient)
                Ellipse().fill(angularGradient)
                Capsule().fill(angularGradient)
            }.padding(.horizontal)
            
            Text("You can also apply gradients to strokes.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.purple).foregroundColor(Color.white)
                .font(.title)
            
            HStack {
                Circle().stroke(angularGradient, lineWidth: 10)
                Ellipse().strokeBorder(angularGradient, lineWidth: 10)
                Capsule()
                    .trim(from: 0.25, to: 1)
                    .stroke(angularGradient, style: StrokeStyle(lineWidth: 10, lineCap: CGLineCap.round))
            }.padding(.horizontal)
        }
    }
}

struct Angular_Circles_Previews : PreviewProvider {
    static var previews: some View {
        Angular_Circles()
    }
}
