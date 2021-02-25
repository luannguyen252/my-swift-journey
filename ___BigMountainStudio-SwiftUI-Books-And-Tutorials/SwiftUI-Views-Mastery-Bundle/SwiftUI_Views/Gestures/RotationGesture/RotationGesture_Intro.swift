//
//  RotationGesture_Intro.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/2/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct RotationGesture_Intro: View {
    @State private var degrees = 0.0
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Gestures").font(.largeTitle)
            Text("Rotation Gesture - Intro").foregroundColor(.gray)
            Text("You can track the rotation from gestures and apply that rotation to a view.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
            
            Text("Rotation: \(degrees)")
            
            Spacer()
            
            ZStack(alignment: .bottom) {
                Image(systemName: "lock")
                    .font(.system(size: 500))
                    .foregroundColor(.green)
                
                Image(systemName: "timelapse")
                    .font(.system(size: 120))
                    .rotationEffect(Angle.degrees(degrees)) // Rotate the view
                    .gesture(RotationGesture()
                        .onChanged({ angle in
                            // Update the state variable with the new angle
                            self.degrees = angle.degrees
                        }))
                    .padding(30)
                .background(Circle().fill(Color.green))
                    .padding(.bottom, 45)
            }
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct RotationGesture_Intro_Previews: PreviewProvider {
    static var previews: some View {
        RotationGesture_Intro()
    }
}
