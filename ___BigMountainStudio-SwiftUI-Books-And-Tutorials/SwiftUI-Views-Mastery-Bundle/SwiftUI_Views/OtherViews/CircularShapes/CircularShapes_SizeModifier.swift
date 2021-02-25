//
//  CircularShapes_Size2.swift
//  100Views
//
//  Created by Mark Moeykens on 7/2/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct CircularShapes_Size2 : View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Circular Shapes")
                .font(.largeTitle)
            
            Text("Size Modifier")
                .foregroundColor(.gray)
            
            Text("You can also use the shape's size modifier to define a height and width. Take warning, though, using size no longer aligns shapes to the center.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(Color.white)
            
            Group {
                Text(".size(width: 80, height: 80)")
                Circle()
                    .size(width: 80, height: 80)
                    .background(Color.purple)
            }
            .padding()
        }
        .font(.title)
    }
}

struct CircularShapes_Size2_Previews : PreviewProvider {
    static var previews: some View {
        CircularShapes_Size2()
    }
}
