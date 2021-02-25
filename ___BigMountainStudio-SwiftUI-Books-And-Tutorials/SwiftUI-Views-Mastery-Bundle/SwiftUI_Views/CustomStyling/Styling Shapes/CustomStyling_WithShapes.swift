//
//  CustomStyling_WithShapes.swift
//  100Views
//
//  Created by Mark Moeykens on 9/14/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct CustomStyling_WithShapes: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("ViewModifier").font(.largeTitle)
            Text("Not For Shapes").font(.title).foregroundColor(.gray)
            Text("The ViewModifier works with a view. If you need to use Shape modifiers, then you can create an extension method on Shape.")
                .modifier(RedBanner())
                .layoutPriority(1)
            
            Circle()
                .addOutline(lineWidth: 10)
            
            Capsule(style: RoundedCornerStyle.continuous)
                .addOutline(lineWidth: 20, trim: 0.5)
            
            RoundedRectangle(cornerRadius: 25)
                .addOutline(lineWidth: 20)
        }
    }
}

extension Shape {
    func addOutline(lineWidth: CGFloat = 1, trim: CGFloat = 1) -> some View {
        let gradientColors = Gradient(colors: [Color.pink,
                                               Color.purple])
        let linearGradient = LinearGradient(gradient: gradientColors,
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing)
        return self
            .trim(from: 0, to: trim)
            .stroke(linearGradient,
                    style: StrokeStyle(lineWidth: lineWidth,
                                       lineCap: CGLineCap.round))
            .padding(lineWidth/2 + 5) // Don't allow stroke to go outside of bounds
    }
}

struct CustomStyling_WithShapes_Previews: PreviewProvider {
    static var previews: some View {
        CustomStyling_WithShapes()
    }
}
