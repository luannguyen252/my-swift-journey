//
//  Rectangular_SizeModifier.swift
//  100Views
//
//  Created by Mark Moeykens on 7/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Rectangular_SizeModifier : View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Rectangular Shapes")
                .font(.largeTitle)
            
            Text("Size Modifier")
                .foregroundColor(.gray)
            
            Text("You can also use the shape's size modifier to define a height and width. Take warning, though, using size no longer aligns shapes to the center.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue)
            
            Group {
                Text("Rectangle using .size(width: 80, height: 80)")
                Rectangle()
                    .size(width: 80, height: 80)
                    .background(Color.blue)
                
                Text("RoundedRectangle using .size(width: 200, height: 120)")
                
                RoundedRectangle(cornerRadius: 20)
                    .size(width: 200, height: 120)
                    .background(Color.blue)
            }
            .padding(.horizontal)
            .font(.body)
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct Rectangular_SizeModifier_Previews : PreviewProvider {
    static var previews: some View {
        Rectangular_SizeModifier()
    }
}
