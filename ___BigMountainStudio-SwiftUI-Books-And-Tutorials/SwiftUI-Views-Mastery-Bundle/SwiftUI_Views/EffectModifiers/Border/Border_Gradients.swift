//
//  Border_Gradients.swift
//  100Views
//
//  Created by Mark Moeykens on 9/22/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Border_Gradients: View {
    var body: some View {
        let gradient = Gradient(colors: [.pink, .purple])
        let angularGradient = AngularGradient(gradient: gradient,
                                              center: .center,
                                              angle: .degrees(0))
        let linearGradient = LinearGradient(gradient: gradient,
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing)
        let smallRadial = RadialGradient(gradient: gradient,
                                         center: .center,
                                         startRadius: 0,
                                         endRadius: 100)
        return VStack(spacing: 30) {
            Text("Border").font(.largeTitle)
            Text("With Gradients").foregroundColor(.gray)
            Text("The first parameter to the border modifier takes a shape style type. Shape styles include gradients.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .layoutPriority(1)
                .foregroundColor(.white)
            
            Button(action: {}) {
                Text("Border around a Button")
                    .padding()
            }.border(angularGradient, width: 10)
            
            Text("Border around Text")
                .padding()
                .border(linearGradient, width: 10)
            
            Image("yosemite")
                .border(smallRadial, width: 10)
        }
        .font(.title)
    }
}

struct Border_Gradients_Previews: PreviewProvider {
    static var previews: some View {
        Border_Gradients()
    }
}
