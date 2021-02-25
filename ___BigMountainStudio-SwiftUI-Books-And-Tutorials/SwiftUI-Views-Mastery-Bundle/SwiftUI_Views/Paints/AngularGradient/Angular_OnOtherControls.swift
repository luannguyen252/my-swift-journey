//
//  Angular_Controls.swift
//  100Views
//
//  Created by Mark Moeykens on 9/5/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Angular_OnOtherControls: View {
    var body: some View {
        let gradient = Gradient(colors: [.pink, .purple, .pink])
        let angularGradient = AngularGradient(gradient: gradient, center: .center, angle: .degrees(0))
        
        return VStack(spacing: 20) {
            Text("Angular Gradient").font(.largeTitle)
            Text("On Other Views") .foregroundColor(.gray)
            Text("Apply angular gradients to control views.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(Color.white)
            
            Button(action: {}) {
                Text("Gradient on Background")
                    .foregroundColor(Color.white)
                    .padding()
            }
            .padding(.horizontal)
            .background(Capsule().fill(angularGradient))
            
            Button(action: {}) {
                Text("Gradient on Border")
                    .padding()
                    .background(
                        Capsule()
                            .stroke(angularGradient, lineWidth: 3))
            }
        }.font(.title)
    }
}

struct Angular_OnOtherControls_Previews: PreviewProvider {
    static var previews: some View {
        Angular_OnOtherControls()
    }
}
