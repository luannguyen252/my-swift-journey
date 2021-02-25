//
//  HueRotation_Colors.swift
//  100Views
//
//  Created by Mark Moeykens on 9/2/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct HueRotation_Colors: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Hue Rotation").font(.largeTitle)
                Text("Changing Colors").font(.title).foregroundColor(.gray)
                Text("Here are more color options.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.red)
                    .layoutPriority(1)
                    .foregroundColor(.white)
                
                VStack(spacing: 8) {
                    HStack(spacing: 0) {
                        Color.red
                            .frame(width: 50, height: 50)
                            .overlay(Text("0°"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(45))
                            .overlay(Text("45°"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(90))
                            .overlay(Text("90°"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(135))
                            .overlay(Text("135°"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(180))
                            .overlay(Text("180°"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(225))
                            .overlay(Text("225°"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(270))
                            .overlay(Text("270°"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(315))
                            .overlay(Text("315°"))
                    }
                    HStack(spacing: 0) {
                        Color.orange
                            .frame(width: 50, height: 50)
                            .overlay(Text("0°"))
                        Color.orange
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(45))
                            .overlay(Text("45°"))
                        Color.orange
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(90))
                            .overlay(Text("90°"))
                        Color.orange
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(135))
                            .overlay(Text("135°"))
                        Color.orange
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(180))
                            .overlay(Text("180°"))
                        Color.orange
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(225))
                            .overlay(Text("225°"))
                        Color.orange
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(270))
                            .overlay(Text("270°"))
                        Color.orange
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(315))
                            .overlay(Text("315°"))
                    }
                    
                    HStack(spacing: 0) {
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .overlay(Text("0°"))
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(45))
                            .overlay(Text("45°"))
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(90))
                            .overlay(Text("90°"))
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(135))
                            .overlay(Text("135°"))
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(180))
                            .overlay(Text("180°"))
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(225))
                            .overlay(Text("225°"))
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(270))
                            .overlay(Text("270°"))
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(315))
                            .overlay(Text("315°"))
                    }
                    
                    HStack(spacing: 0) {
                        Color.green
                            .frame(width: 50, height: 50)
                            .overlay(Text("0°"))
                        Color.green
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(45))
                            .overlay(Text("45°"))
                        Color.green
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(90))
                            .overlay(Text("90°"))
                        Color.green
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(135))
                            .overlay(Text("135°"))
                        Color.green
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(180))
                            .overlay(Text("180°"))
                        Color.green
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(225))
                            .overlay(Text("225°"))
                        Color.green
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(270))
                            .overlay(Text("270°"))
                        Color.green
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(315))
                            .overlay(Text("315°"))
                    }
                    HStack(spacing: 0) {
                        Color.blue
                            .frame(width: 50, height: 50)
                            .overlay(Text("0°"))
                        Color.blue
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(45))
                            .overlay(Text("45°"))
                        Color.blue
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(90))
                            .overlay(Text("90°"))
                        Color.blue
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(135))
                            .overlay(Text("135°"))
                        Color.blue
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(180))
                            .overlay(Text("180°"))
                        Color.blue
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(225))
                            .overlay(Text("225°"))
                        Color.blue
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(270))
                            .overlay(Text("270°"))
                        Color.blue
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(315))
                            .overlay(Text("315°"))
                    }
                    
                    HStack(spacing: 0) {
                        Color.purple
                            .frame(width: 50, height: 50)
                            .overlay(Text("0°"))
                        Color.purple
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(45))
                            .overlay(Text("45°"))
                        Color.purple
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(90))
                            .overlay(Text("90°"))
                        Color.purple
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(135))
                            .overlay(Text("135°"))
                        Color.purple
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(180))
                            .overlay(Text("180°"))
                        Color.purple
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(225))
                            .overlay(Text("225°"))
                        Color.purple
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(270))
                            .overlay(Text("270°"))
                        Color.purple
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(315))
                            .overlay(Text("315°"))
                    }
                    
                    HStack(spacing: 0) {
                        Color.pink
                            .frame(width: 50, height: 50)
                            .overlay(Text("0°"))
                        Color.pink
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(45))
                            .overlay(Text("45°"))
                        Color.pink
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(90))
                            .overlay(Text("90°"))
                        Color.pink
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(135))
                            .overlay(Text("135°"))
                        Color.pink
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(180))
                            .overlay(Text("180°"))
                        Color.pink
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(225))
                            .overlay(Text("225°"))
                        Color.pink
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(270))
                            .overlay(Text("270°"))
                        Color.pink
                            .frame(width: 50, height: 50)
                            .hueRotation(Angle.degrees(315))
                            .overlay(Text("315°"))
                    }
                    
                }
                
                Image("ColorWheel")
            }
        }
    }
}

struct HueRotation_Colors_Previews: PreviewProvider {
    static var previews: some View {
        HueRotation_Colors()
    }
}
