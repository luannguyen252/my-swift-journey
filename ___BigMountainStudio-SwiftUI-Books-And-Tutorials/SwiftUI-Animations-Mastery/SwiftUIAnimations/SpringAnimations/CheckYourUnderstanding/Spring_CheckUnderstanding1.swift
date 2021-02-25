//
//  Spring_CheckUnderstanding1.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/8/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Spring_CheckUnderstanding1: View {
    @State private var isOn = false
    var body: some View {
        Button(action: {
            self.isOn.toggle()
        }) {
            Text(isOn ? "ON" : "OFF")
                .foregroundColor(.white)
                .padding()
                .animation(.none) // Don't animate the text change
        }
        .padding(.horizontal, 24)
        .background(Capsule().fill(isOn ? Color.green : Color.red))
        .scaleEffect(isOn ? 1.4 : 1)
        .shadow(color: isOn ? .green : .red,
                radius: isOn ? 10 : 5, x: 0,
                y: isOn ? 10 : 5)
        .animation(Animation.interpolatingSpring(stiffness: 20, damping: 5, initialVelocity: -10))
    }
}

struct Spring_CheckUnderstanding1_Previews: PreviewProvider {
    static var previews: some View {
        Spring_CheckUnderstanding1()
    }
}
