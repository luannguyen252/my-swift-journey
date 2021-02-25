//
//  Circles_2_00_Strokes.swift
//  100Views
//
//  Created by Mark Moeykens on 6/8/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Circles_2_00_Strokes : View {
    var body: some View {
VStack(spacing: 5) {
    Text("Circular Shapes").font(.largeTitle)
    Text("Stroke (Outline)").foregroundColor(.gray)
    Text("Use strokes to create outlines around shapes. Using .stroke(Color.purple):")
        .frame(maxWidth: .infinity)
        .padding()
        .layoutPriority(1)
        .background(Color.purple)
        .foregroundColor(Color.white)
    
    Circle()
        .stroke(Color.purple)
        .padding()
    
    Text(".stroke(Color.purple, lineWidth: 20)")
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.purple)
        .foregroundColor(Color.white)
    
    Capsule()
        .stroke(Color.purple, lineWidth: 20)
        .padding()
    
    Text(".stroke(Color.blue, style: StrokeStyle(lineWidth: 10, dash: [15, 10]))")
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.purple)
        .foregroundColor(Color.white)
        .layoutPriority(1)
    
    Ellipse()
        /* dash parameter
         The 15 represents the length of the dash
         The 10 represents the length in between dashes
         */
        .stroke(Color.purple, style: StrokeStyle(lineWidth: 10, dash: [15, 10]))
        .padding()
}
.font(.title)
    }
}

struct Circles_2_00_Strokes_Previews : PreviewProvider {
    static var previews: some View {
        Circles_2_00_Strokes()
    }
}
