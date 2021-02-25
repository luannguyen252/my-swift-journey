//
//  Trigger_Slider.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/5/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Trigger_Slider: View {
    @State private var blueWidth: CGFloat = 50.0
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Triggers")
            SubtitleText("Slider")
            BannerText("When adjusting a slider, there may be some UI element you are changing that can be animated.", backColor: .green)
            
            HStack(spacing: 0) {
                Color.blue
                    .frame(width: blueWidth)
                Color.green
            }.animation(.default)
            
            Slider(value: $blueWidth, in: 0...410, step: 1)
                .padding()
            
        }.font(.title)
    }
}

struct Trigger_Slider_Previews: PreviewProvider {
    static var previews: some View {
        Trigger_Slider()
    }
}
