//
//  CircularShapesWithButtons.swift
//  100Views
//
//  Created by Mark Moeykens on 8/12/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct CircularShapesWithButtons: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Circular Shapes").font(.largeTitle)
            Text("Using with Buttons").font(.title).foregroundColor(.gray)
            Text("You can apply circular shapes to other views using the .background modifier")
                .frame(maxWidth: .infinity)
                .font(.title)
                .padding()
                .layoutPriority(1)
                .background(Color.purple)
                .foregroundColor(Color.white)
            Button(action: {}) {
                Text("Use the Capsule shape")
                    .bold().padding()
            }
            .background(Capsule().strokeBorder(Color.purple, lineWidth: 1))
            .accentColor(.purple)
            
            Button(action: {}) {
                Text("Use the Capsule shape")
                    .foregroundColor(.white)
                    .bold()
                    .padding()
            }
            .background(Capsule().foregroundColor(.purple))
            .accentColor(.purple)
            
            Text("Circle and Button combination:")
            Button(action: {}) {
                Image(systemName: "circle.grid.hex.fill")
                    .font(.largeTitle)
                    .padding()
            }
            .background(Circle()
            .foregroundColor(.purple))
            .accentColor(.white)
        }.font(.title)
    }
}

struct CircularShapesWithButtons_Previews: PreviewProvider {
    static var previews: some View {
        CircularShapesWithButtons()
    }
}
