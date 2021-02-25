//
//  HueRotation_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct HueRotation_Intro: View {
    private var lightRed = Color(hue: 1, saturation: 0.5, brightness: 1)
    private var darkRed = Color(hue: 1, saturation: 1, brightness: 0.5)
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Hue Rotation").font(.largeTitle)
                Text("Introduction").font(.title).foregroundColor(.gray)
                Text("Hue rotation shifts a color counter-clockwise around the color wheel.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                
                Image("ColorWheel")
                
                VStack(spacing: 5) {
                    Text("Light Red")
                    HStack {
                        lightRed
                            .frame(width: 50, height: 50)
                            .overlay(Text("0"))
                        lightRed
                            .frame(width: 50, height: 50)
                            .hueRotation(.degrees(45))
                            .overlay(Text("45°"))
                        lightRed
                            .frame(width: 50, height: 50)
                            .hueRotation(.degrees(90))
                            .overlay(Text("90°"))
                        lightRed
                            .frame(width: 50, height: 50)
                            .hueRotation(.degrees(180))
                            .overlay(Text("180°"))
                        lightRed
                            .frame(width: 50, height: 50)
                            .hueRotation(.degrees(270))
                            .overlay(Text("270°"))
                    }
                    Text("Red")
                    HStack {
                        Color.red
                            .frame(width: 50, height: 50)
                            .luminanceToAlpha()
                        Color.red
                            .frame(width: 50, height: 50)
                            .hueRotation(.degrees(45))
                            .overlay(Text("45°"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .hueRotation(.degrees(90))
                            .overlay(Text("90°"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .hueRotation(.degrees(180))
                            .overlay(Text("180°"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .hueRotation(.degrees(270))
                            .overlay(Text("270°"))
                    }
                    Text("Dark Red")
                    HStack {
                        darkRed
                            .frame(width: 50, height: 50)
                            .overlay(Text("0"))
                        darkRed
                            .frame(width: 50, height: 50)
                            .hueRotation(.degrees(45))
                            .overlay(Text("45°"))
                        darkRed
                            .frame(width: 50, height: 50)
                            .hueRotation(.degrees(90))
                            .overlay(Text("90°"))
                        darkRed
                            .frame(width: 50, height: 50)
                            .hueRotation(.degrees(180))
                            .overlay(Text("180°"))
                        darkRed
                            .frame(width: 50, height: 50)
                            .hueRotation(.degrees(270))
                            .overlay(Text("270°"))
                    }.foregroundColor(.white)
                }
                
                Text("Light colors rotate to light colors. Dark colors rotate to dark colors.")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .padding()
                    .layoutPriority(2)
                    .background(Color.red)
                    .foregroundColor(.white)
            }
        }
    }
}

struct HueRotation_Intro_Previews: PreviewProvider {
    static var previews: some View {
        HueRotation_Intro()
    }
}
