//
//  Circles_Trim.swift
//  100Views
//
//  Created by Mark Moeykens on 7/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Circles_Trim_Outline : View {
    @State private var circleProgress: CGFloat = 1.0
    private var circlePercentage: Int { Int(circleProgress * 100.0) }
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Circular Shapes").font(.largeTitle)
            Text("Trim Function").font(.title).foregroundColor(.gray)
            Text("Trim your shape to only show a percentage of it.")
                .frame(maxWidth: .infinity, minHeight: 70)
                .font(.title).padding()
                .background(Color.purple).foregroundColor(Color.white)
            
            Circle()
                .trim(from: 0, to: circleProgress)
                .stroke(Color.purple,
                        style: StrokeStyle(lineWidth: 40,
                                           lineCap: CGLineCap.round))
                .frame(height: 300)
                .rotationEffect(.degrees(-90)) // Start from top
                .overlay(
                    Text("\(circlePercentage)%")
                        .font(.largeTitle)
                        .foregroundColor(.gray))
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

struct Circles_Trim_Outline_Previews : PreviewProvider {
    static var previews: some View {
        Circles_Trim_Outline()
    }
}
