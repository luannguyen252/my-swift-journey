//
//  MetalSupport.swift
//  Drawing
//
//  Created by Sandesh on 31/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

struct MetalSupport: View {
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            ColorCycliungCircle(amount: self.colorCycle)
            .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
            .padding()
        }
    }
}

struct ColorCycliungCircle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0 ..< steps) { value in
                Circle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        self.color(for: value, brightness: 1),
                        self.color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
            .drawingGroup()
            /*
             .drawing group renders the entire view at time rather then renderind each of its sub views individually, this task is powerd by metal behid the scene is accomplished by creating seperate buffer for rendering the view
             */
        }
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + amount
        
        if targetHue > 1.0 {
            targetHue -= 1
        }
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct MetalSupport_Previews: PreviewProvider {
    static var previews: some View {
        MetalSupport()
    }
}
