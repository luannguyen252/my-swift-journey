//
//  Interpolation_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 9/16/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Interpolation_Intro: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Interpolation").font(.largeTitle)
            Text("Introduction").font(.title).foregroundColor(.gray)
            Text("Use interpolation to smooth out an image when it is resized.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.green)
                .layoutPriority(1)
                .foregroundColor(.white)
            
            Text("Interpolation: None")
            Image("yosemite")
                .resizable()
                .interpolation(Image.Interpolation.none)
            
            Text("Interpolation: High")
            Image("yosemite")
                .resizable()
                .interpolation(.high) // Smooth out to a high degree
        }.font(.title)
    }
}

struct Interpolation_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Interpolation_Intro()
    }
}
