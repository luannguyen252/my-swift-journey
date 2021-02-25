//
//  Position_Coordinates.swift
//  100Views
//
//  Created by Mark Moeykens on 9/21/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Position_Coordinates: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Position").font(.largeTitle)
            Text("Introduction").foregroundColor(.gray)
            Text("X & Y coordinates start in the upper left corner.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
            
            Image("XYCoordinates")
            
            ZStack {
                Text("50, 20")
                    .position(x: 50, y: 20) // Upper left
                
                Text("350, 20")
                    .position(x: 350, y: 20) // Upper right
                
                Text("60, 230")
                    .position(x: 60, y: 230) // Lower left
                
                Text("350, 230")
                    .position(x: 350, y: 230) // Lower right
            }
            .border(Color.purple, width: 5)
            Text("What you are positioning is actually the center point of the view.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
        }
        .font(.title)
    }
}

struct Position_Coordinates_Previews: PreviewProvider {
    static var previews: some View {
        Position_Coordinates()
    }
}
