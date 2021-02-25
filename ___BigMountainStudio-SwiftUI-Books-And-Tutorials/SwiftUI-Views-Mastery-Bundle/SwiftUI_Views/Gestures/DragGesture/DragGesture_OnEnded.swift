//
//  DragGesture_OnEnded.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/2/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct DragGesture_OnEnded: View {
    @State private var circlePosition = CGPoint(x: 55, y: 55)
    @State private var circleLabel = "55,55"
    @State private var isOK = true
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Gestures").font(.largeTitle)
            Text("Drag - OnEnded").foregroundColor(.gray)
            Text("When the gesture has completed, use the onEnded callback to perform some action.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue).foregroundColor(.white)
            Text("Drag to the right for red")
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .opacity(0.8)
                .overlay(Text(circleLabel).multilineTextAlignment(.center)
                    .foregroundColor(.white))
                .position(circlePosition)
                .gesture(DragGesture()
                    .onChanged({ value in
                        self.circlePosition = value.location
                        self.circleLabel = "\(Int(value.location.x)), \(Int(value.location.y))"
                    })
                    .onEnded({ value in
                        self.isOK = value.location.x < 200 ? true : false
                    }))
                .background(isOK ? Color.clear : Color.pink)
        }.font(.title)
    }
}

struct DragGesture_OnEnded_Previews: PreviewProvider {
    static var previews: some View {
        DragGesture_OnEnded()
    }
}
