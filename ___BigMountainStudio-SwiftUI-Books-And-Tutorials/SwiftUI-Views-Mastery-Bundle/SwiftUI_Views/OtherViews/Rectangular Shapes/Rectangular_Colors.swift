//
//  Rectangular_Colors.swift
//  100Views
//
//  Created by Mark Moeykens on 7/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Rectangular_Colors : View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Rectangular Shapes")
                .font(.largeTitle)
            
            Text("Colors")
                .foregroundColor(.gray)
            
            Text("Rectangular shapes can have shape styles applied to them. Color is considered a shape style along with different gradient patterns.")
                .frame(maxWidth: .infinity)
                .padding().background(Color.blue)
                .layoutPriority(1)
            
            Text("Using .fill(Color.pink)")
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.pink)
                .padding()
            
            Text("You can also use .foregroundColor(Color.green)")
            Rectangle()
                .foregroundColor(Color.green)
                .padding()
            
            Text("Using .background(Color.blue)")
            RoundedRectangle(cornerRadius: .infinity)
                .background(Color.blue)
                .padding()
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct Rectangular_Colors_Previews : PreviewProvider {
    static var previews: some View {
        Rectangular_Colors()
    }
}
