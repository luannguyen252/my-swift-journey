//
//  HueRotation_Photos.swift
//  100Views
//
//  Created by Mark Moeykens on 9/2/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct HueRotation_Photos: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 5) {
                HeaderView("Hue Rotation", subtitle: "With Photos", desc: "Applying hue rotation on a photo will rotate all colors.",
                           back: .red, textColor: .white)
                    Image("rainbow").resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .overlay(Text("0°"))
                    Image("rainbow").resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .hueRotation(Angle.degrees(90))
                        .overlay(Text("90°"))
                    Image("rainbow").resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .hueRotation(Angle.degrees(180))
                        .overlay(Text("180°"))
                    Image("rainbow").resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .hueRotation(Angle.degrees(270))
                        .overlay(Text("270°"))
                
                Text("Photo by Daniele Pelusi")
                    .font(.caption)
            }
            .font(.title)
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct HueRotation_Photos_Previews: PreviewProvider {
    static var previews: some View {
        HueRotation_Photos()
    }
}
