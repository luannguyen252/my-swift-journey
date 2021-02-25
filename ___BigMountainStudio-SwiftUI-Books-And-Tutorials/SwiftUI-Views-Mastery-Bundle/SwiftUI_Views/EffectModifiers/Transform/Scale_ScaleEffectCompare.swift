//
//  Scale_ScaleEffectCompare.swift
//  100Views
//
//  Created by Mark Moeykens on 9/6/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Scale_ScaleEffectCompare: View {
    @State private var applyEffect = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Transform Effect").font(.largeTitle)
            Text("Compared With ScaleEffect").font(.title).foregroundColor(.gray)
            Text("Using scaleEffect, you can resize views. By default, the anchor point is in the center and can be changed.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .layoutPriority(1)
                .foregroundColor(.white)
            
            Spacer()
            Image(systemName: "flame")
                .font(.system(size: 100))
                .foregroundColor(.red)
                .scaleEffect(applyEffect
                    ? CGSize(width: 2, height: 2)
                    : CGSize(width: 1, height: 1)) // Resize back to normal
            
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

struct Scale_ScaleEffectCompare_Previews: PreviewProvider {
    static var previews: some View {
        Scale_ScaleEffectCompare()
    }
}
