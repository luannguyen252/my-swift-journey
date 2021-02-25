//
//  Rotation3D_Anchors.swift
//  100Views
//
//  Created by Mark Moeykens on 9/3/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Rotation3D_Anchors: View {
    @State private var degrees = -45.0
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Rotation 3D Effect").font(.largeTitle)
            Text("Anchors").font(.title).foregroundColor(.gray)
            Text("The anchor is the point in which the rotation revolves. By default, it is in the center. You can specify a different anchor.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.yellow)
                .layoutPriority(1)
                .foregroundColor(.black)
            Text("(Frames shown in orange for clarity.)")
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow).opacity(0.7)
                .overlay(Text("Top Anchor (X)").font(.largeTitle).bold())
                .rotation3DEffect(Angle(degrees: degrees),
                                  axis: (x: 1.0, y: 0.0, z: 0.0),
                                  anchor: .top)
                .border(Color.orange)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow).opacity(0.7)
                .overlay(Text("Trailing Anchor (Y)").font(.largeTitle).bold())
                .rotation3DEffect(Angle(degrees: degrees),
                                  axis: (x: 0.0, y: 1.0, z: 0.0),
                                  anchor: .trailing)
                .border(Color.orange)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow).opacity(0.7)
                .overlay(Text("Top Leading Anchor (Z)").font(.largeTitle).bold())
                .rotation3DEffect(Angle(degrees: degrees),
                                  axis: (x: 0.0, y: 0.0, z: 1.0),
                                  anchor: .topLeading)
                .border(Color.orange)
            
            Slider(value: $degrees, in: -180...180, step: 1)
                .padding()
        }
        .minimumScaleFactor(0.5)
    }
}

struct Rotation3D_Anchors_Previews: PreviewProvider {
    static var previews: some View {
        Rotation3D_Anchors()
    }
}
