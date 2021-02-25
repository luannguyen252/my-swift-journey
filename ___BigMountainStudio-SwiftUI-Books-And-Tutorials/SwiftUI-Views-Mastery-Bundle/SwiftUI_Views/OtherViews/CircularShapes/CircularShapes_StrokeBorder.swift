//
//  CircularShapes_StrokeBorder.swift
//  100Views
//
//  Created by Mark Moeykens on 7/2/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct CircularShapes_StrokeBorder : View {
    var body: some View {
        VStack(spacing: 5) {
            Text("Circular Shapes").font(.largeTitle)
            Text("Stroke Border (Inner Stroke)").foregroundColor(.gray)
            Text("A stroke modifier grows outward from the center of the shape's outline and can cause overlapping issues.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(Color.white)
                .layoutPriority(1)
            
            ZStack {
                Capsule()
                    .stroke(Color(UIColor.purple), lineWidth:  50)
                Capsule()
                    .stroke() // Black outline
            }
            
            Text("A strokeBorder modifier will grow inward from the shape's outline.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(Color.white)
                .layoutPriority(1)
            
            ZStack {
                Capsule()
                    .strokeBorder(Color.purple, lineWidth:  50)
                Capsule()
                    .stroke() // Black outline
            }
        }.font(.title)
    }
}

struct CircularShapes_StrokeBorder_Previews : PreviewProvider {
    static var previews: some View {
        CircularShapes_StrokeBorder()
    }
}
