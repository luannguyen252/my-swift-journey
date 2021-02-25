//
//  MagnificationGesture_Info.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/3/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct MagnificationGesture_Info: View {
    @GestureState var scale: CGFloat = 1.0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Gestures").font(.largeTitle)
            Text("Magnification Gesture - Intro").foregroundColor(.gray)
            Text("You can connect the scale effect to the magnification's magnitude property to zoom in or out on a view.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.yellow)
            
            Text("Pinch Zoom")
            Spacer()
            Image("yosemite_large")
                .scaleEffect(scale)
                .gesture(MagnificationGesture()
                    .updating($scale, body: { (value, scale, transaction) in
                        scale = value.magnitude // "magnitude" means size or extent of something
                    })
            )
            Spacer()
            Text("Magnification: \(scale)")
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct MagnificationGesture_Info_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGesture_Info()
    }
}
