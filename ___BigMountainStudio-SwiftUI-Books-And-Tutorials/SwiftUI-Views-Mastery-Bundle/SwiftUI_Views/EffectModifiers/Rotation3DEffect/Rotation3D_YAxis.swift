//
//  Rotation3D_YAxis.swift
//  100Views
//
//  Created by Mark Moeykens on 9/3/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Rotation3D_YAxis: View {
    @State private var degrees = 25.0
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Rotation 3D Effect").font(.largeTitle)
            Text("Y Axis").font(.title).foregroundColor(.gray)
            Text("Here are examples or rotating just on the Y axis.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.yellow)
                .layoutPriority(1)
                .foregroundColor(.black)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow).opacity(0.7)
                .overlay(
                    Text("45° Back on Y Axis")
                        .font(.largeTitle).bold()
            ) // Make sure only the y axis has a value
                .rotation3DEffect(Angle(degrees: 45),
                                  axis: (x: 0.0, y: 1.0, z: 0.0))
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow)
                .overlay(
                    Text("-45° Forward on Y Axis")
                        .font(.largeTitle).bold()
            )
                .rotation3DEffect(Angle(degrees: -45),
                                  axis: (x: 0.0, y: 1.0, z: 0.0))
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow)
                .overlay(
                    Text("Move slider to adjust rotation")
                        .font(.largeTitle).bold()
            )
                .rotation3DEffect(Angle(degrees: degrees),
                                  axis: (x: 0.0, y: 1.0, z: 0.0))
            
            Slider(value: $degrees, in: -180...180, step: 1)
                .padding()
        }
        .minimumScaleFactor(0.5)
    }
}

struct Rotation3D_YAxis_Previews: PreviewProvider {
    static var previews: some View {
        Rotation3D_YAxis()
    }
}
