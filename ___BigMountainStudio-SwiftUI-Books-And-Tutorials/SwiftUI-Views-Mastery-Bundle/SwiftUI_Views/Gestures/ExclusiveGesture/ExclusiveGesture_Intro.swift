//
//  ExclusiveGesture_Intro.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/3/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ExclusiveGesture_Intro: View {
    // You can combine gesture values into your own object
    struct StateForGestures {
        var degrees = 0.0
        var doubleTapped = false
    }
    
    @State private var stateForGestures = StateForGestures()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Gestures").font(.largeTitle)
            Text("Exclusive Gestures").foregroundColor(.gray)
            Text("If you want two gestures on your view but only ONE will work, then use the exclusive function on the first gesture.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
            
            Text("Double-Tap OR Rotate")
            Image("yosemite_large")
                .border(stateForGestures.doubleTapped ? Color.red : Color.clear)
                .shadow(radius: stateForGestures.doubleTapped ? 8 : 0)
                .rotationEffect(Angle.degrees(stateForGestures.degrees))
                .gesture(TapGesture(count: 2)
                    .onEnded({ () in
                        self.stateForGestures.doubleTapped.toggle()
                    })
                    .exclusively(before: RotationGesture()
                        .onChanged({ (angle) in
                            self.stateForGestures.degrees = angle.degrees
                        })
                ))
            Text("Rotation: \(stateForGestures.degrees)")
        }.font(.title)
    }
}

struct ExclusiveGesture_Intro_Previews: PreviewProvider {
    static var previews: some View {
        ExclusiveGesture_Intro()
    }
}
