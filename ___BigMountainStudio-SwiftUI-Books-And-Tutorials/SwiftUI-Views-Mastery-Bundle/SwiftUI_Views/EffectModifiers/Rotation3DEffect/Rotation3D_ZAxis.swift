//
//  Rotation3D_ZAxis.swift
//  100Views
//
//  Created by Mark Moeykens on 9/3/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Rotation3D_ZAxis: View {
    @State private var degrees = 10.0
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Rotation 3D Effect").font(.largeTitle)
            Text("Z Axis").font(.title).foregroundColor(.gray)
            Text("Rotating on the Z axis is just like using rotationEffect modifier.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.yellow)
                .layoutPriority(1)
                .foregroundColor(.black)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow)
                .opacity(0.7)
                .overlay(
                    Text("25° on Z Axis")
                        .font(.largeTitle).bold()
            ) // Make sure only the z axis has a value
                .rotation3DEffect(Angle(degrees: 25),
                                  axis: (x: 0.0, y: 0.0, z: 1.0))
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow)
                .opacity(0.7)
                .overlay(
                    Text("-25° on Z Axis")
                        .font(.largeTitle).bold()
            )
                .rotation3DEffect(Angle(degrees: -25),
                                  axis: (x: 0.0, y: 0.0, z: 1.0))
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow)
                .opacity(0.7)
                .overlay(
                    Text("Move slider to adjust rotation")
                        .font(.largeTitle).bold()
            )
                .rotation3DEffect(Angle(degrees: degrees),
                                  axis: (x: 0.0, y: 0.0, z: 1.0))
            
            Slider(value: $degrees, in: -180...180, step: 1).padding()
        }
        .minimumScaleFactor(0.5)
    }
}

struct Rotation3D_ZAxis_Previews: PreviewProvider {
    static var previews: some View {
        Rotation3D_ZAxis()
    }
}
