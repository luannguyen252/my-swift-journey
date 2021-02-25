//
//  Slider_WithImages.swift
//  100Views
//
//  Created by Mark Moeykens on 7/6/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Slider_WithImages : View {
    @State private var sliderValue = 0.5
    
    var body: some View {
        VStack(spacing: 20) {
                HeaderView("Slider",
                           subtitle: "With Images",
                           desc: "Combine the slider with images or values.",
                           back: .orange, textColor: .black)
            
            Slider(value: $sliderValue,
                   minimumValueLabel: Image(systemName: "tortoise"),
                   maximumValueLabel: Image(systemName: "hare"), label: {})
                .foregroundColor(.green)
                .padding()
            
            Slider(value: $sliderValue,
                   minimumValueLabel: Text("0"),
                   maximumValueLabel: Text("1"), label: {})
                .padding()
            
            VStack {
                Slider(value: $sliderValue)
                    .accentColor(.orange)
                HStack {
                    Image(systemName: "circle")
                    Spacer()
                    Image(systemName: "circle.righthalf.fill")
                    Spacer()
                    Image(systemName: "circle.fill")
                }
                .foregroundColor(.orange)
                .padding(.top, 8)
            }.padding()
        }.font(.title)
    }
}

struct Slider_WithImages_Previews : PreviewProvider {
    static var previews: some View {
        Slider_WithImages()
    }
}
