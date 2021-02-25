//
//  Rotation_RotationEffectCompare.swift
//  100Views
//
//  Created by Mark Moeykens on 9/6/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Rotation_RotationEffectCompare: View {
    @State private var applyEffect = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Transform Effect").font(.largeTitle)
            Text("Compared With RotationEffect").font(.title).foregroundColor(.gray)
            Text("Using rotationEffect, you can also rotate views. By default, the anchor point is in the center.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .layoutPriority(1)
                .foregroundColor(.white)
            
            Spacer()
            
            Image(systemName: "pencil.and.outline")
                .font(.system(size: 100))
                .foregroundColor(.red)
                .rotationEffect(applyEffect
                    ? Angle.degrees(180)
                    : Angle.zero) // Reset the rotation effect
            
            Spacer()
            
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
    }
}

struct Rotation_RotationEffectCompare_Previews: PreviewProvider {
    static var previews: some View {
        Rotation_RotationEffectCompare()
    }
}
