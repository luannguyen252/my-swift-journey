//
//  Opacity_Layers.swift
//  100Views
//
//  Created by Mark Moeykens on 9/2/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Opacity_Layers: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("Opacity").font(.largeTitle)
            Text("On Layers").font(.title).foregroundColor(.gray)
            Text("Use opacity to only affect the layers you want.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .layoutPriority(1)
                .foregroundColor(.white)
            
            Text("Opacity just on content layer")
                .padding(.top)
            Image("yosemite")
                .opacity(0.3)
                .background(Color.purple)
            
            Text("Opacity on all layers")
                .padding(.top)
            Image("yosemite")
                .background(Color.purple)
                .opacity(0.3)
            
            Text("Opacity on top layer")
                .padding(.top)
            Image("yosemite")
                .overlay(Color.purple.opacity(0.3))
        }
        .minimumScaleFactor(0.5)
    }
}

struct Opacity_Layers_Previews: PreviewProvider {
    static var previews: some View {
        Opacity_Layers()
    }
}
