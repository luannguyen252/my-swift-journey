//
//  Linear_ShapesAndControls.swift
//  100Views
//
//  Created by Mark Moeykens on 8/24/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Linear_ShapesAndControls: View {
    let gradientColors = Gradient(colors: [Color.pink, Color.purple])
    
    var body: some View {
        let linearGradient = LinearGradient(gradient: gradientColors,
                                            startPoint: .top,
                                            endPoint: .bottom)
        
        return VStack(spacing: 20) {
            Text("LinearGradient")
                .font(.largeTitle)
            Text("On Shapes & Controls")
                .foregroundColor(.gray)
            Text("You can apply gradients to shapes and controls using the fill and background modifiers respectively.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.pink)
                .foregroundColor(.black)
            
            Capsule()
                .fill(linearGradient)
                .frame(height: 80)
                .padding()
            
            Button(action: {}) {
                Text("Button")
                    .foregroundColor(.white)
                    .padding()
            }
            .background(linearGradient)
            .cornerRadius(15)
            
            Text("Use strokeBorder to apply a gradient to the borders of shapes.")
                .padding(.horizontal)
            Circle()
                .strokeBorder(linearGradient, lineWidth: 20)
                .frame(height: 150)
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct Linear_ShapesAndControls_Previews: PreviewProvider {
    static var previews: some View {
        Linear_ShapesAndControls()
    }
}
