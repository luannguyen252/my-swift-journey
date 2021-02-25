//
//  Rotation3D_XYAxes.swift
//  100Views
//
//  Created by Mark Moeykens on 9/3/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Rotation3D_XYAxes: View {
    @State private var degrees = 70.0
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Rotation 3D Effect").font(.largeTitle)
            Text("X & Y Axes").font(.title).foregroundColor(.gray)
            Text("Combine and X and Y axis values to create an angled line (vector) to rotate on.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.yellow)
                .layoutPriority(1)
                .foregroundColor(.black)
            
            Text("axis: (x: 1.0, y: 2.0, z: 0.0)")
            Text("Creates this vector to rotate on:")
            
            Image("XY")
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow)
                .opacity(0.7)
                .overlay(
                    Text("Move slider to adjust rotation")
                        .font(.largeTitle).bold()
            )
                .rotation3DEffect(Angle(degrees: degrees),
                                  axis: (x: 1.0, y: 2.0, z: 0.0))
            
            Slider(value: $degrees, in: -180...180, step: 1)
                .padding()
        }
        .minimumScaleFactor(0.5)
    }
}
struct Rotation3D_XYAxes_Previews: PreviewProvider {
    static var previews: some View {
        Rotation3D_XYAxes()
    }
}
