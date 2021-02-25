//
//  AccentColor_ForegroundColor.swift
//  100Views
//
//  Created by Mark Moeykens on 9/17/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct AccentColor_ForegroundColor: View {
    @State private var slider = 0.5
    var body: some View {
        VStack(spacing: 30) {
            Text("AccentColor").font(.largeTitle)
            Text("Compared to ForegroundColor").foregroundColor(.gray)
            Text("Why can't you use foreground color modifier instead? Foreground color will apply to every view that supports it.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
            
            Button("Button with Purple Accent Color", action: {})
            
            Button(action: {}) {
                HStack {
                    Image(systemName: "bag.fill.badge.plus")
                    Text("Add to Cart")
                }
            }
            
            Text("Slider with Purple Accent Color")
            Slider(value: $slider)
            
            Image(systemName: "gauge")
            
            Text("Now, all the text and the image views were affected but not the slider.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
        }
        .font(.title)
        .minimumScaleFactor(0.5)
        .foregroundColor(.purple) // Apply to all child views
    }
}

struct AccentColor_ForegroundColor_Previews: PreviewProvider {
    static var previews: some View {
        AccentColor_ForegroundColor()
    }
}
