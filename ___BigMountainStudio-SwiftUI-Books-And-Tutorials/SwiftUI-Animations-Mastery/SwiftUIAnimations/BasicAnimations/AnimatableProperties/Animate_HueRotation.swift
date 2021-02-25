//
//  Animate_HueRotation.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/31/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Animate_HueRotation: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animatable Properties")
            SubtitleText("Hue")
            BannerText("Another way to change color is to change the hue on the color wheel by rotating the current point.", backColor: .blue, textColor: .white)
            Image("ColorWheel")
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .padding()
                    .hueRotation(Angle.degrees(change ? 170 : 0)) // Rotate around color wheel
                    .animation(.easeInOut)
                
                Image("umbrella")
                    .resizable()
                    .scaledToFit()
                    .hueRotation(Angle.degrees(change ? 170 : 0)) // Rotate around color wheel
                    .animation(.easeInOut)
            }
            Button("Change") {
                self.change.toggle()
            }
        }.font(.title)
    }
}

struct Animate_HueRotation_Previews: PreviewProvider {
    static var previews: some View {
        Animate_HueRotation()
            .preferredColorScheme(.dark)
            .background(Color(.systemBackground).edgesIgnoringSafeArea(.all))
    }
}
