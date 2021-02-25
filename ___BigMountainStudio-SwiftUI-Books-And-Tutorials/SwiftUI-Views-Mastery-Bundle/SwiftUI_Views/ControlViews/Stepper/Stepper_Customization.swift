//
//  Stepper_Customization.swift
//  100Views
//
//  Created by Mark Moeykens on 6/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Stepper_Customization : View {
    @State private var contrast = 50
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Stepper").font(.largeTitle).padding()
            Text("Customization").foregroundColor(.gray)
            Text("A foreground and background color can be set.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
            
            Stepper(onIncrement: {}, onDecrement: {}) {
                Text("Custom Stepper")
                    .padding(.vertical)
            }
            .padding(.horizontal)
            .background(Color.blue)
            .foregroundColor(.white)
            Text("Notice the minus and plus buttons are not affected. The platforms determine how this will be shown.")
                .padding(.horizontal)
            Text("You can add images too.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
            
            Stepper(value: $contrast, in: 0...100) {
                // SwiftUI implicitly uses an HStack here
                Image(systemName: "circle.lefthalf.fill")
                Text(" \(contrast)/100")
            }
            .padding(.horizontal)
            .foregroundColor(.blue)
        }
        .font(.title)
    }
}

struct Stepper_Customization_Previews : PreviewProvider {
    static var previews: some View {
        Stepper_Customization()
    }
}
