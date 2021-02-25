//
//  Shadows_OpacityMatters.swift
//  100Views
//
//  Created by Mark Moeykens on 9/5/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Shadow_OpacityAndShadows: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Shadow").font(.largeTitle)
                Text("Opacity & Shadows").font(.title).foregroundColor(.gray)
                Text("Shadows will form around the opaque (solid) parts of the view. So sometimes you will have to add a solid shape or a color to put the shadow around.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                
                Button(action: {}) {
                    Text("Just Outside")
                        .font(.title)
                }
                .padding()
                .background(
                    Capsule()
                        .stroke(Color.blue, lineWidth: 2)
                        .shadow(color: .black, radius: 5))
                
                Text("Say you want the shadow just on the outside of the button. You need an opaque fill. Here is one way to solve this:")
                    .font(.title)
                    .padding(.horizontal)
                
                Button(action: {}) {
                    Text("Just Outside")
                        .font(.title)
                }
                .padding()
                .background(
                    // Solid white capsule inside
                    Capsule()
                        .fill(Color.white)
                        // Add the shadow on the capsule
                        .shadow(color: .black, radius: 5)
                )
                    // Overlay a border on top
                    .overlay(Capsule().stroke(Color.blue, lineWidth: 2))
                
                Text("Here is another way:")
                    .font(.title)
                    .padding(.horizontal)
                
                Button(action: {}) {
                    Text("Just Outside")
                        .font(.title)
                }
                .padding()
                    // You can use a solid white fill with a corner radius
                    .background(Color.white)
                    .cornerRadius(.infinity)
                    .shadow(color: .black, radius: 5)
                    .overlay(Capsule().stroke(Color.blue, lineWidth: 2))
            }
        }
    }
}

struct Shadow_OpacityAndShadows_Previews: PreviewProvider {
    static var previews: some View {
        Shadow_OpacityAndShadows()
    }
}
