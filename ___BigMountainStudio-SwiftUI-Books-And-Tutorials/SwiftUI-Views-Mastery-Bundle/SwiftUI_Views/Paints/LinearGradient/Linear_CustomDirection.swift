//
//  Linear_CustomDirection.swift
//  100Views
//
//  Created by Mark Moeykens on 8/24/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Linear_CustomDirection: View {
    let gradientColors = Gradient(colors: [Color.purple, Color.red])
    
    var body: some View {
        VStack(spacing: 20) {
            Text("LinearGradient")
                .font(.largeTitle)
            
            Text("Custom Direction")
                .foregroundColor(.gray)
            
            Text("If you don't want to use the preset UnitPoints then you can create different points using an X and Y coordinate. The X and Y values will range from 0 to 1.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.pink)
                .foregroundColor(.black)
            
            Image("CoordinateSpace")
            
            HStack(spacing: 20) {
                Rectangle()
                    .fill(LinearGradient(gradient: gradientColors,
                                         startPoint: UnitPoint(x: 0, y: 0.25),
                                         endPoint: UnitPoint(x: 1, y: 0.75)))
                    .frame(width: 100, height: 100)
                
                Rectangle()
                    .fill(LinearGradient(gradient: gradientColors,
                                         startPoint: UnitPoint(x: 0.65, y: 0.65),
                                         endPoint: UnitPoint(x: 0.8, y: 0.75)))
                    .frame(width: 100, height: 100)
                
                Rectangle()
                    .fill(LinearGradient(gradient: gradientColors,
                                         startPoint: UnitPoint(x: 0.9, y: 0.8),
                                         endPoint: UnitPoint(x: 0.25, y: 0.15)))
                    .frame(width: 100, height: 100)
            }
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct Linear_CustomDirection_Previews: PreviewProvider {
    static var previews: some View {
        Linear_CustomDirection()
    }
}
