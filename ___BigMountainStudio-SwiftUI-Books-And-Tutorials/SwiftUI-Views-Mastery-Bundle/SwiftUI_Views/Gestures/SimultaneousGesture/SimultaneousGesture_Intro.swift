//
//  SimultaneousGesture_Intro.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/3/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct SimultaneousGesture_Intro: View {
    @State private var degrees = 0.0
    @State var scale: CGFloat = 1.0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Gestures").font(.largeTitle)
            Text("Combining Gestures").foregroundColor(.gray)
            Text("To combine gestures, use the simultaneously function available on gestures.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
            
            Text("Zoom AND Rotate")
            
            Image("yosemite_large")
                .scaleEffect(scale)
                .rotationEffect(Angle.degrees(degrees))
                .gesture(MagnificationGesture().simultaneously(with: RotationGesture())
                    .onChanged({ value in
                        // Use the .first property to access the first gesture (MagnificationGesture)
                        self.scale = value.first ?? 1.0
                        // Use the .second property to access the second gesture (RotationGesture)
                        self.degrees = value.second?.degrees ?? 0.0
                    }))
            Text("Rotation: \(degrees)")
            Text("Magnification: \(scale)")
        }.font(.title)
    }
}

struct SimultaneousGesture_Intro_Previews: PreviewProvider {
    static var previews: some View {
        SimultaneousGesture_Intro()
    }
}
