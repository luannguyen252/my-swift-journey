//
//  Rotation_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Rotation_Intro: View {
    @State private var degrees = -35.0
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Rotation Effect").font(.largeTitle)
                Text("Introduction").font(.title).foregroundColor(.gray)
                Text("Use rotation effect to rotate views around their center point.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.green)
                    .layoutPriority(1)
                    .foregroundColor(.white)
                
                HStack {
                    Text("-90°")
                        .rotationEffect(Angle(degrees: -90))
                    Text("-45°")
                        .rotationEffect(Angle(degrees: -45))
                    Text("0°")
                        .rotationEffect(Angle(degrees: 0))
                    Text("45°")
                        .rotationEffect(Angle(degrees: 45))
                    Text("90°")
                        .rotationEffect(Angle(degrees: 90))
                }
                .font(.largeTitle)
                .padding()
                
                Divider().background(Color.green)
                
                Text("Rotations are fun!")
                    .font(Font.custom("Nightcall", size: 34))
                    .rotationEffect(Angle(degrees: degrees))
                    .border(Color.green)
                    .padding(.vertical, 60)
                
                Slider(value: $degrees, in: -180...180, step: 1)
                    .padding()
                
                Text("Notice it is the content that is getting rotated and the frame is still in place.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.green)
                    .layoutPriority(1)
                    .foregroundColor(.white)
            }
        }
    }
}

struct Rotation_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Rotation_Intro()
    }
}
