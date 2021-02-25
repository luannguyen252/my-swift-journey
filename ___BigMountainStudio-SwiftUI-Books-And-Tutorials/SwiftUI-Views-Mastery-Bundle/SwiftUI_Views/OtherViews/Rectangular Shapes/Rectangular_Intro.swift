//
//  Rectangular_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 7/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Rectangular_Intro : View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Rectangular Shapes")
                .font(.largeTitle)
            
            Text("Introduction")
                .foregroundColor(.gray)
            
            Text("There are two rectangular shapes available in SwiftUI.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
            
            Text("Rectangle")
            
            Rectangle()
                .padding()
            
            Text("Rounded Rectangle")
            
            RoundedRectangle(cornerRadius: 20)
                .padding()
            
            Text("(Notice the default colors are the primary color.)")
                .font(.body)
                .padding()
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct Rectangular_Intro_Previews : PreviewProvider {
    static var previews: some View {
        Rectangular_Intro()
    }
}
