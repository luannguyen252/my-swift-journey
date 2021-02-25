//
//  CircularShapes_Colors.swift
//  100Views
//
//  Created by Mark Moeykens on 7/2/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct CircularShapes_Colors : View {
    var body: some View {
        VStack(spacing: 5) {
            Text("Circular Shapes").font(.largeTitle)
            Text("Colors").foregroundColor(.gray)
            Text("Circular shapes (and other shapes) can have shape styles applied to them. Color is considered a shape style along with different gradient patterns. You 'fill' a shape with color.")
                .frame(maxWidth: .infinity)
                .padding().background(Color.purple)
                .foregroundColor(Color.white)
                .minimumScaleFactor(0.5)
            
            Text("Using .fill(Color.purple)")
            
            Circle()
                .fill(Color.purple)
                .frame(height: 80)
                .padding()
            
            Text("Using .foregroundColor(.purple)")
            
            Circle()
                .foregroundColor(.purple)
                .frame(height: 80)
                .padding()
            
            Text("(Note: The fill modifier applies specifically to shapes. It cannot be used on a view.)")
                .frame(maxWidth: .infinity)
                .padding().background(Color.purple)
                .foregroundColor(Color.white)
                .minimumScaleFactor(0.5)
        }
        .font(.title)
    }
}

struct CircularShapes_Colors_Previews : PreviewProvider {
    static var previews: some View {
        CircularShapes_Colors()
    }
}
