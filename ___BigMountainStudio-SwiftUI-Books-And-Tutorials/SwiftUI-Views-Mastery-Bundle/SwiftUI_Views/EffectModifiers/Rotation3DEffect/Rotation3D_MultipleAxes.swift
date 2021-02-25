//
//  Rotation3D_MultipleAxes.swift
//  100Views
//
//  Created by Mark Moeykens on 9/3/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Rotation3D_MultipleAxes: View {
    @State private var degrees = -65.0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Rotation 3D Effect").font(.largeTitle)
                Text("X, Y & Z Axes").font(.title).foregroundColor(.gray)
                Text("Now it gets a little more complicated to think on all 3 axes. Plot the vector using X, Y and Z values.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.yellow)
                    .layoutPriority(1)
                    .foregroundColor(.black)
                Text("axis: (x: 2.0, y: 4.0, z: 3.0)")
                Image("XYZ")
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.yellow)
                    .opacity(0.7)
                    .overlay(
                        Text("Move slider to adjust rotation")
                            .font(.largeTitle).bold()
                )
                    .rotation3DEffect(Angle(degrees: degrees),
                                      axis: (x: 2, y: 4, z: -3))
                
                Slider(value: $degrees, in: -180...180, step: 1)
                    .padding()
                Text("Crazy!")
            }
            .minimumScaleFactor(0.5)
        }
    }
}

struct Rotation3D_MultipleAxes_Previews: PreviewProvider {
    static var previews: some View {
        Rotation3D_MultipleAxes()
    }
}
