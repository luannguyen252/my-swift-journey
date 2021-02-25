//
//  Shapes.swift
//  100Views
//
//  Created by Mark Moeykens on 9/4/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("Shapes")
                .font(.largeTitle)
            Text("Short Introduction")
                .foregroundColor(.gray)
            Text("I'll make shapes, give them color and put them behind other views just for decoration.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
            
            Text("This text has a rounded rectangle behind it")
                .foregroundColor(Color.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20) // Create the shape
                        .foregroundColor(Color.blue)) // Make shape blue
                .padding()
            
            Text("But sometimes I'll use color and a corner radius:")
            
            Text("This text has a color with a corner radius")
                .foregroundColor(Color.white)
                .padding()
                .background(Color.blue) // Use a color as the background layer
                .cornerRadius(20) // Rounded corners on whole text view
        }
        .font(.title)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
