//
//  SequenceGesture_Intro.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/3/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct SequenceGesture_Intro: View {
    
    struct GestureSequenceState {
        var firstGestureComplete: Bool = false
        var degrees = 0.0
    }
    
    @GestureState var gestureSequenceState = GestureSequenceState()
    
    @GestureState private var degrees = 0.0
    @GestureState var scale: CGFloat = 1.0
//    @State var isRotationEnabled = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Gestures").font(.largeTitle)
            Text("Sequence Gestures - Intro").foregroundColor(.gray)
            Text("When you need one gesture to activate before a second gesture becomes available, then use the sequenced function.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.red).foregroundColor(.white)
            
            Text("Tap THEN Rotate")
            
            Image("yosemite_large")
                .scaleEffect(scale)
                .rotationEffect(Angle.degrees(degrees))
                .shadow(radius: gestureSequenceState.firstGestureComplete ? 8 : 0)
                .border(gestureSequenceState.firstGestureComplete ? Color.red : Color.clear)
//                .gesture(TapGesture(count: 2).sequenced(before: RotationGesture())
//                    .updating($gestureSequenceState, body: { (value: SequenceGesture<TapGesture, RotationGesture>.Value, state, transaction) in
//                        switch value {
//                        case .first(let value):
//                            // This first gesture never registers - bug with TapGesture and Sequence?
//                            state.firstGestureComplete = true
//                            print("first gesture begins")
//                        case .second(let value, let angle):
//                            state.degrees = angle?.degrees ?? 0.0
//                        }
//                    }))
//                .gesture(
//                    //TapGesture(count: 2)
//                    LongPressGesture(minimumDuration: 1)
//                    .sequenced(before: RotationGesture())
//                    .updating($gestureSequenceState, body: { (value, state, transaction) in
//
//                        let firstGestureState = value
//
//                        switch value {
//                        case .first(true):
//                            print("first gesture started")
//                            state.firstGestureComplete = true
//                        case .second(true, let magnitude):
//                            // This means that the first gesture has ended
//                            print("first gesture ended")
//                        default:
//                            break
//                        }
//                        //                            degrees = value.degrees
//                    })
//            )
            
            
            //                .gesture(MagnificationGesture()
            //                    .updating($scale, body: { (value, scale, transaction) in
            //                        scale = value.magnitude
            //                    })
            //                    .sequenced(before: RotationGesture()
            //                        .updating($degrees, body: { (angle, degrees, transaction) in
            //                            degrees = angle.degrees
            //                        })
            //                ))
            
            Text("Rotation: \(degrees)")
            Text("Magnification: \(scale)")
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct SequenceGesture_Intro_Previews: PreviewProvider {
    static var previews: some View {
        SequenceGesture_Intro()
    }
}
