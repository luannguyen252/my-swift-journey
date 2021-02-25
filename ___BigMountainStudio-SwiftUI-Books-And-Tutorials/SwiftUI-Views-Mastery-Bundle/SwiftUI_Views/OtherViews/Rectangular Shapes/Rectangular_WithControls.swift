//
//  Rectangular_WithButtons.swift
//  100Views
//
//  Created by Mark Moeykens on 8/12/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Rectangular_WithControls: View {
    @State private var textField = "Rounded Rectangle with TextField"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Rectangular Shapes").font(.largeTitle)
            Text("Using with Controls").font(.title).foregroundColor(.gray)
            Text("You can apply rectangular shapes to other views using the .background modifier")
                .frame(maxWidth: .infinity)
                .font(.title)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
            
            Button(action: {}) {
                Text("RoundedRectange and Button")
                    .bold().padding()
            }
            .background(RoundedRectangle(cornerRadius: 10)
            .strokeBorder(Color.blue, lineWidth: 1))
            .accentColor(.blue)
            
            Button(action: {}) {
                Text("RoundedRectange and Button")
                    .foregroundColor(.white)
                    .bold().padding()
            }
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.blue))
            .accentColor(.green)
            
            TextField("Placeholder Text", text: $textField)
                .foregroundColor(.white)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.blue))
                .padding()
        }
    }
}

struct Rectangular_WithControls_Previews: PreviewProvider {
    static var previews: some View {
        Rectangular_WithControls()
    }
}
