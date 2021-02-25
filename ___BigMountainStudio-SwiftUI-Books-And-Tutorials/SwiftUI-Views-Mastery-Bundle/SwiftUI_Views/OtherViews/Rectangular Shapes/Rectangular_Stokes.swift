//
//  Rectangular_Stokes.swift
//  100Views
//
//  Created by Mark Moeykens on 7/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Rectangular_Stokes : View {
    var body: some View {
        VStack(spacing: 5) {
            Text("Rectangular Shapes").font(.largeTitle)
            Text("Stroke (Outline)").foregroundColor(.gray)
            Text("Use stokes to create outlines around shapes. Using .stroke(Color.purple):")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue).layoutPriority(1)
            Rectangle()
                .stroke(Color.blue)
                .padding()
            
            Text(".stroke(Color.blue, lineWidth: 20)")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue)
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.blue, lineWidth: 20)
                .padding()
            
            Text(".stroke(Color.purple, style: StrokeStyle(lineWidth: 10, dash: [15, 10]))")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue).layoutPriority(1)
            RoundedRectangle(cornerRadius: 25)
                /* dash parameter
                 The 15 represents the length of the dash
                 The 25 represents the length in between dashes
                 */
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: CGLineCap.round, dash: [15, 25]))
                .padding()
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct Rectangular_Stokes_Previews : PreviewProvider {
    static var previews: some View {
        Rectangular_Stokes()
    }
}
