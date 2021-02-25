//
//  Rotation3D_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/26/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Rotation3D_XAxis: View {
    @State private var degrees = 25.0
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Rotation 3D Effect").font(.largeTitle)
            Text("X Axis").font(.title).foregroundColor(.gray)
            Text("You can rotate views in three dimensions on the X, Y and Z axes. You can rotate on one axis or many axes.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.yellow)
                .layoutPriority(1)
                .foregroundColor(.black)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow)
                .overlay(
                    Text("45° Back on X Axis")
                        .font(.largeTitle).bold()
            ) // Make sure only the x axis has a value
                .rotation3DEffect(Angle(degrees: 45),
                                  axis: (x: 1.0, y: 0.0, z: 0.0))
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow)
                .overlay(
                    Text("-45° Forward on X Axis")
                        .font(.largeTitle).bold()
            )
                .rotation3DEffect(Angle(degrees: -45),
                                  axis: (x: 1.0, y: 0.0, z: 0.0))
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow)
                .overlay(
                    Text("Move slider to adjust rotation")
                        .font(.largeTitle).bold()
            )
                .rotation3DEffect(Angle(degrees: degrees),
                                  axis: (x: 1.0, y: 0.0, z: 0.0))
            
            Slider(value: $degrees, in: -180...180, step: 1).padding()
        }
        .minimumScaleFactor(0.5)
    }
}

struct Rotation3D_XAxis_Previews: PreviewProvider {
    static var previews: some View {
        Rotation3D_XAxis()
    }
}
