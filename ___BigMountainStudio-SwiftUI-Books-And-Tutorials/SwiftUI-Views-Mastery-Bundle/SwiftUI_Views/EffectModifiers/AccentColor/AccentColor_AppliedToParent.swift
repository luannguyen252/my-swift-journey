//
//  AccentColor_AppliedToParent.swift
//  100Views
//
//  Created by Mark Moeykens on 9/17/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct AccentColor_AppliedToParent: View {
    @State private var slider = 0.5
    var body: some View {
        VStack(spacing: 30) {
            Text("AccentColor").font(.largeTitle)
            Text("Apply to Parent").foregroundColor(.gray)
            Text("Accent color can also be applied to a container and it will be applied to all child views within it.")
                .frame(maxWidth: .infinity).padding()
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
            Text("Notice the text and image views were not affected when using the accent color modifier.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.purple)
                .foregroundColor(.white)
        }
        .font(.title)
        .minimumScaleFactor(0.5)
        .accentColor(.purple) // Apply to all child views
    }
}

struct AccentColor_AppliedToParent_Previews: PreviewProvider {
    static var previews: some View {
        AccentColor_AppliedToParent()
    }
}
