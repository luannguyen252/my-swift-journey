//
//  Trigger_Gesture_Magnification.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/5/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Trigger_Gesture_Magnification: View {
    @GestureState private var scale: CGFloat = 0.0
    @State private var endScale: CGFloat = 1.0
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Trigger")
            SubtitleText("Magnification Gesture")
            BannerText("Animation can smooth out the magnification of views.", backColor: .green)
            
            Text("Zoom In")
            
            Spacer()
            
            Image("castle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .scaleEffect(scale + endScale)
                .gesture(MagnificationGesture()
                    .updating($scale, body: { (value, scale, transaction) in
                        scale = value.magnitude
                    })
                    .onEnded({ (value) in
                        self.endScale = value.magnitude + self.endScale
                    })
                )
                .animation(.default) // Smooth the zooming in and out
            
            Spacer()
        }.font(.title)
    }
}

struct Trigger_Gesture_Magnification_Previews: PreviewProvider {
    static var previews: some View {
        Trigger_Gesture_Magnification()
    }
}
