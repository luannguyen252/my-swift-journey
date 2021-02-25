//
//  Rotation.swift
//  100Views
//
//  Created by Mark Moeykens on 9/6/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Rotation: View {
    @State private var applyEffect = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Transform Effect").font(.largeTitle)
            Text("Rotation").font(.title).foregroundColor(.gray)
            Text("Use this transform effect to rotate a view.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .layoutPriority(1)
                .foregroundColor(.white)
            
            Spacer()
            Image(systemName: "arrow.turn.up.left")
                .font(.system(size: 40))
            Image(systemName: "pencil.and.outline")
                .border(Color.purple)
                .font(.system(size: 100))
                .foregroundColor(.purple)
                .transformEffect(applyEffect
                    ? CGAffineTransform(rotationAngle: CGFloat(Angle.degrees(180).radians))
                    : .identity) // Identify removes all transformations
                .border(Color.purple)
            
            Spacer()
            
            Text("Notice the rotation anchor is the top leading corner. At this time, I'm not sure how to change the anchor through SwiftUI.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .layoutPriority(1)
                .foregroundColor(.white)
            
            HStack {
                Spacer()
                Button("Apply Effect") {
                    self.applyEffect = true
                }
                Spacer()
                Button("Remove Effect") {
                    self.applyEffect = false
                }
                Spacer()
            }
        }
        .minimumScaleFactor(0.5)
    }
}

struct Rotation_Previews: PreviewProvider {
    static var previews: some View {
        Rotation()
    }
}
