//
//  Circles_Trim_SolidShapes.swift
//  100Views
//
//  Created by Mark Moeykens on 9/3/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Circles_Trim_SolidShapes: View {
    @State private var circleProgress: CGFloat = 1.0
    private var circlePercentage: Int { Int(circleProgress * 100.0) }
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Circular Shapes").font(.largeTitle)
            Text("Trim Solid Shapes").font(.title).foregroundColor(.gray)
            Text("Trim your solid shape to only show a percentage of it.")
                .frame(maxWidth: .infinity, minHeight: 70)
                .font(.title)
                .padding()
                .background(Color.purple)
                .foregroundColor(Color.white)
            
            Circle()
                .trim(from: 0, to: circleProgress)
                .fill(Color.purple)
                .frame(height: 300)
                .rotationEffect(.degrees(-90)) // Start from top
                .overlay(
                    Text("\(circlePercentage)%")
                        .font(.largeTitle))
                .padding(40)
            
            VStack {
                Text("Progress")
                HStack {
                    Text("0%")
                    Slider(value: $circleProgress)
                    Text("100%")
                }
            }.padding()
        }
    }
}

struct Circles_Trim_SolidShapes_Previews: PreviewProvider {
    static var previews: some View {
        Circles_Trim_SolidShapes()
    }
}
