//
//  AccentColor_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 9/17/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct AccentColor_Intro: View {
    @State private var slider = 0.5
    
    var body: some View {
        VStack(spacing: 20) {
            Text("AccentColor").font(.largeTitle)
            Text("Introduction").foregroundColor(.gray)
            Text("Accent color is used to indicate to the user that a control can be interacted with. The default accent color is blue.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.purple)
                .foregroundColor(.white)
            
            Button("Button with Default Accent Color", action: {})
            Button("Button with Purple Accent Color", action: {})
                .accentColor(.purple) // Change accent color
            
            Button(action: {}) {
                HStack {
                    Image(systemName: "bag.fill.badge.plus")
                    Text("Add to Cart")
                }
            }
            .accentColor(.purple)
            
            Text("Slider with Default Accent Color")
            Slider(value: $slider)
            
            Text("Slider with Purple Accent Color")
            Slider(value: $slider)
                .accentColor(.purple) // Change accent color
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct AccentColor_Intro_Previews: PreviewProvider {
    static var previews: some View {
        AccentColor_Intro()
    }
}
