//
//  Rotation3DEffect_XAxis_Center.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/2/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Rotation3DEffect_XAxis_Center: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Rotation3DEffect")
            SubtitleText("Introduction")
            BannerText("3D rotations are a lot of fun with many options. Start by just rotating on the X axis.")
            
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.orange)
                .frame(width: 400, height: 200)
                .overlay(Text("Rotations are fun!"))
                // Provide a value to just the x axis
                .rotation3DEffect(Angle.degrees(change ? 180 : 0), axis: (x: 1, y: 0, z: 0))
                .animation(.easeInOut(duration: 1))
            
            Button("Change") {
                self.change.toggle()
            }
        }.font(.title)
    }
}

struct Rotation3DEffect_XAxis_Center_Previews: PreviewProvider {
    static var previews: some View {
        Rotation3DEffect_XAxis_Center()
    }
}
