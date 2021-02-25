//
//  Background_Shapes.swift
//  100Views
//
//  Created by Mark Moeykens on 8/24/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Background_Shapes: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Background").font(.largeTitle)
            Text("Using Shapes").foregroundColor(.gray)
            Text("Use the background modifier to apply shapes to the background of views. Shapes include the Circle, Capsule, Ellipse, Rectangle and RoundedRectangle.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
            
            Text("Background shapes on shapes")
            Circle()
                .frame(width: 132, height: 44)
                .foregroundColor(.yellow)
                .background(Circle()
                    .foregroundColor(.black)
                    .offset(x: 3, y: 3))
            
            Text("Background shapes on controls")
            Button(action: {}) {
                Text("Button").padding(.horizontal)
            }
            .padding()
            .background(Capsule().foregroundColor(.yellow))
            
            Text("Background shapes on layout views")
            HStack() {
                Text("This is in an HStack")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Ellipse().foregroundColor(.yellow))
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct Background_Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Background_Shapes()
    }
}
