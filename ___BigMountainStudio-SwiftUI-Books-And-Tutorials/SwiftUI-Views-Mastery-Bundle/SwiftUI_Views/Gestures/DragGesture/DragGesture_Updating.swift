//
//  DragGesture_Updating.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/2/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct DragGesture_Updating: View {
    @State private var circlePosition = CGPoint(x: 55, y: 55)
    @State private var circleLabel = "55,55"
    @GestureState private var isDragging = false // Will reset to false when dragging has ended
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Gestures").font(.largeTitle)
            Text("Drag - Updating").foregroundColor(.gray)
            Text("You could also use the updating callback to perform the same actions.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue).foregroundColor(.white)
            Text("Drag the circle")
            Text("isDragging: \(isDragging.description)")
            Circle()
                .fill(isDragging ? Color.orange : Color.blue)
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
                    .updating($isDragging) { (value, state, transaction) in
                        // You don't update isDragging directly. It's read-only. Instead, you update state. The state updates the isDragging.
                        state = true
                })
            Text("Updating uses GestureState as a parameter. GestureState resets whatever value it is given when the gesture has ended.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue).foregroundColor(.white)
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct DragGesture_Updating_Previews: PreviewProvider {
    static var previews: some View {
        DragGesture_Updating()
    }
}
