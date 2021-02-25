//
//  Projection_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Projection_Intro: View {
    
    // I didn't want to include this in the book because there are easier ways to do these things. So I'm not sure what the point is of having these modifiers.
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Projection Effect").font(.largeTitle)
                Text("Rotation").font(.title).foregroundColor(.gray)
                Text("You can use projection effect to rotate views.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.green)
                    .layoutPriority(1)
                    .foregroundColor(.white)
                Text("Original Image")
                Image("square.with.dot")
                
                Text("Rotation Applied")
                HStack(spacing: 44) {
                    Image("square.with.dot")
                        .projectionEffect(ProjectionTransform(
                            CGAffineTransform(rotationAngle: -1)))
                    Image("square.with.dot")
                        .projectionEffect(ProjectionTransform(
                            CGAffineTransform(rotationAngle: -0.5)))
                    Image("square.with.dot")
                        .projectionEffect(ProjectionTransform(
                            CGAffineTransform(rotationAngle: 0.5)))
                    Image("square.with.dot")
                        .projectionEffect(ProjectionTransform(
                            CGAffineTransform(rotationAngle: 1)))
                }
                .padding()
                .font(.largeTitle)
                .foregroundColor(.green)
                
                Text("The view is rotated around the red dot. This is known as the anchor point.")
                
                Text("To remove a transform, you use .identity")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.green)
                    .layoutPriority(1)
                    .foregroundColor(.white)
                Image("square.with.dot")
                    .projectionEffect(ProjectionTransform(.identity))
            }
        }
    }
}

struct Projection_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Projection_Intro()
    }
}
