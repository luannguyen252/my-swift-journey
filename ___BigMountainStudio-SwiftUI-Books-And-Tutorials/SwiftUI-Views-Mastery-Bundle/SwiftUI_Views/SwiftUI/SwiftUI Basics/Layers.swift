//
//  Layers.swift
//  100Views
//
//  Created by Mark Moeykens on 9/4/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Layers: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("Layers")
                .font(.largeTitle)
            
            Text("The Basics")
                .foregroundColor(.gray)
            
            Text("With SwiftUI views, you can add layers on top (.overlay) and behind (.background) the view.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
            
            Image("yosemite") // Show an image from Assets.xcassets
                .opacity(0.7) // Make image only 70% solid
                .background(Color.red.opacity(0.3)) // Layer behind image
                .background(Color.yellow.opacity(0.3)) // Layer behind red
                .background(Color.blue.opacity(0.3)) // Layer behind yellow
                .overlay(Text("Yosemite")) // Layer on top of image
            
            Image("Layers")
                .resizable() // Allows image to change size
                .aspectRatio(contentMode: .fit) // Keeps image the same aspect ratio when resizing
        }
        .font(.title)
    }
}

struct Layers_Previews: PreviewProvider {
    static var previews: some View {
        Layers()
    }
}
