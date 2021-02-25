//
//  Stepper_Colors.swift
//  100Views
//
//  Created by Mark Moeykens on 6/29/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Stepper_Colors : View {
    @State private var contrast = 50
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Stepper").font(.largeTitle)
            Text("Colors").font(.title).foregroundColor(.gray)
            
            Text("There is no built-in way to change the color of the stepper that I have found. Instead, I had to hide the label and apply a color behind it.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue).foregroundColor(Color.white)
                .font(.title).minimumScaleFactor(0.8) // Allow text to resize on smaller devices
            
            Group {
                Stepper(value: $contrast, in: 0...100) {
                    Text("Default Color")
                }
                Stepper(value: $contrast, in: 0...100) {
                    Text("Applying Accent Color (no effect)")
                }
                .accentColor(.blue)
                
                HStack {
                    Text("My Custom Colored Stepper")
                    Spacer()
                    Stepper("Age", value: $contrast)
                        .background(Color(UIColor.systemTeal))
                        .cornerRadius(9)
                        .labelsHidden() // Hide the label
                }
                
                HStack {
                    Text("My Custom Colored Stepper")
                    Spacer()
                    Stepper("Count", value: $contrast)
                        .background(Color.orange)
                        .cornerRadius(9)
                        .labelsHidden() // Hide the label
                }
                
                HStack {
                    Text("My Custom Colored Stepper")
                    Spacer()
                    Stepper("", value: $contrast)
                        .background(Color.red)
                        .cornerRadius(9)
                        .labelsHidden() // Hide the label
                }
                
                HStack {
                    Text("My Custom Colored Stepper")
                    Spacer()
                    Stepper("", value: $contrast)
                        .background(Color.pink)
                        .cornerRadius(9)
                        .labelsHidden() // Hide the label
                }
                
                HStack {
                    Text("My Custom Colored Stepper")
                    Spacer()
                    Stepper("", value: $contrast)
                        .background(Color.purple)
                        .cornerRadius(9)
                        .labelsHidden() // Hide the label
                }
                
                HStack {
                    Text("My Custom Colored Stepper")
                    Spacer()
                    Stepper("", value: $contrast)
                        .background(Color.yellow)
                        .cornerRadius(9)
                        .labelsHidden() // Hide the label
                }
                
                HStack {
                    Text("Using RoundedRectangle:")
                    Spacer()
                    Stepper("", value: $contrast)
                        .background(RoundedRectangle(cornerRadius: 9).fill(Color.green))
                        .labelsHidden() // Hide the label
                }
            }.padding(.horizontal)
        }
    }
}

struct Stepper_Colors_Previews : PreviewProvider {
    static var previews: some View {
        Stepper_Colors()
    }
}
