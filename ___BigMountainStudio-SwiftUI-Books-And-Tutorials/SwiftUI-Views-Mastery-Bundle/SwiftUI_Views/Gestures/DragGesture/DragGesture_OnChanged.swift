//
//  DragGesture.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/2/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct DragGesture_OnChanged: View {
    @State private var circlePosition = CGPoint(x: 50, y: 50)
    @State private var circleLabel = "50,50"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Gestures").font(.largeTitle)
            Text("Drag - OnChanged").foregroundColor(.gray)
            Text("Attach a drag gesture modifier to a view to allow a user to drag it. Use the onChanged callback to get information about the drag.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
            Text("Drag the circle")
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .opacity(0.8)
                .overlay(Text(circleLabel)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white))
                .position(circlePosition) // Set position inside the coordinate space
                .gesture(DragGesture()
                    .onChanged({ value in
                        // Move the circle while dragging
                        self.circlePosition = value.location
                        // Update label inside of circle
                        self.circleLabel = "\(Int(value.location.x)), \(Int(value.location.y))"
                    }))
                .border(Color.blue)
        }.font(.title)
    }
}

struct DragGesture_OnChanged_Previews: PreviewProvider {
    static var previews: some View {
        DragGesture_OnChanged()
    }
}
