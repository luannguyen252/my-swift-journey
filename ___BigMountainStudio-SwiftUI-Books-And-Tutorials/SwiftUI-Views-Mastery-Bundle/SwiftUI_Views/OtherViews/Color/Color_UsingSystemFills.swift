//
//  Color_WithUIColor_FillsAndBackgrounds.swift
//  100Views
//
//  Created by Mark Moeykens on 9/10/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Color_UsingSystemFills: View {
    @State private var sliderValue = 0.5
    @State private var switchValue = false
    
    var body: some View {
        ZStack {
            Color.orange
            
            VStack(spacing: 5) {
                Text("Color")
                    .font(.largeTitle)
                
                Text("Using System Fills")
                    .foregroundColor(.white)
                
                Text("There are also UIColor \"fills\" that have specific purposes you could take advantage of.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .minimumScaleFactor(0.5)
                
                VStack {
                    Text("This view uses the UIColor quaternarySystemFill. Use it to fill in large areas like this.")
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(UIColor.systemFill))
                        .overlay(Text("systemFill"))
                        .frame(height: 50)
                    
                    Text("Use .systemFill for thin or small shapes. Like Apple uses on the Slider track:")
                    
                    Slider(value: $sliderValue)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(UIColor.secondarySystemFill))
                        .overlay(Text("secondarySystemFill"))
                        .frame(height: 50)
                    
                    Toggle(isOn: $switchValue) {
                        Text("The Toggle uses secondarySystemFill for its background fill")
                    }
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(UIColor.tertiarySystemFill))
                        .overlay(Text("tertiarySystemFill"))
                        .frame(height: 50)
                    
                    Button("Using tertiarySystemFill for Buttons", action: {})
                        .padding()
                        .background(Capsule().fill(Color(UIColor.tertiarySystemFill)))
                        .accentColor(.blue)
                }
                .font(.body)
                .padding()
                .background(Color(UIColor.quaternarySystemFill))
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white))
                .padding(.horizontal, 20)
                .minimumScaleFactor(0.5)
            }
            .padding(EdgeInsets(top: 30, leading: 0, bottom: 10, trailing: 0))
            .foregroundColor(.black)
            .font(.title)
        }
        .ignoresSafeArea()
    }
}

struct Color_UsingSystemFills_Previews: PreviewProvider {
    static var previews: some View {
        Color_UsingSystemFills()
    }
}
