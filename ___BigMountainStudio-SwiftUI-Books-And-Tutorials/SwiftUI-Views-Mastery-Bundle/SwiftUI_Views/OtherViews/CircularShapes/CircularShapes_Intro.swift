//
//  Circles_1_00.swift
//  100Views
//
//  Created by Mark Moeykens on 6/8/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct CircularShapes_Intro : View {
    var body: some View {
        VStack(spacing: 5) {
            HeaderView("Circular Shapes",
                       subtitle: "Introduction",
                       desc: "There are three circular shapes available in SwiftUI:", back: .purple, textColor: .white)
                .layoutPriority(1)
            
            Text("Circle")
            
            Circle()
                .padding()
            
            Text("Capsule")
            
            Capsule()
                .padding()
            
            Text("Ellipse")
            
            Ellipse()
                .padding()
            
            Text("(Notice the default colors default to the primary color.)")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(Color.white)
        }
        .font(.title)
    }
}

struct CircularShapes_Intro_Previews : PreviewProvider {
    static var previews: some View {
        CircularShapes_Intro()
    }
}
