//
//  Button-BitmapImages.swift
//  100Views
//
//  Created by Mark Moeykens on 9/1/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Button_WithPhotos: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Button").font(.largeTitle)
            Text("With Images")
                .font(.title).foregroundColor(.gray)
            Text("Buttons work fine with the SF Symbols. But what if you wanted to use a photo? Look what happens:")
                .padding().frame(maxWidth: .infinity)
                .background(Color.purple)
                .font(.title)
            
            Button(action: {}) {
                Image("yosemite")
                    .cornerRadius(40)
            }
            Text("This is because the image rendering mode is set to \"template\" by default. This means all non-transparent areas will use the accent color. You need to change the rendering mode to fix this.")
                .padding().frame(maxWidth: .infinity)
                .background(Color.purple)
                .font(.title)
            
            Button(action: {}) {
                Image("yosemite")
                    // Change rendering mode to original
                    .renderingMode(.original)
                    .cornerRadius(40)
            }
        }
        .minimumScaleFactor(0.8) // Allow text to resize on smaller devices
    }
}

struct Button_BitmapImages_Previews: PreviewProvider {
    static var previews: some View {
        Button_WithPhotos()
    }
}
