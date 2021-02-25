//
//  Border_RoundedCornersImages.swift
//  100Views
//
//  Created by Mark Moeykens on 8/28/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Border_RoundedCornersImages: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Border").font(.largeTitle)
            Text("Rounded Borders on Images")
                .font(.title).foregroundColor(.gray)
            Text("Images act differently when you try to add a RoundedRectangle with a border to their background.")
                .frame(maxWidth: .infinity, maxHeight: 138)
                .font(.title).padding()
                .background(Color.purple)
                .foregroundColor(.white)
            
            Image("yosemite")
                .background(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.purple, lineWidth: 5))
            
            Text("The border is behind the image. Let's use an overlay instead.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .foregroundColor(.white)
            
            Image("yosemite")
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.purple, lineWidth: 5))
            
            Text("You can see the corners of the image still. You need to mask the image.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .foregroundColor(.white)
            
            Image("yosemite")
                .mask(RoundedRectangle(cornerRadius: 21))
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.purple, lineWidth: 5))
        }
        .minimumScaleFactor(0.5)
    }
}

struct Border_RoundedCornersImages_Previews: PreviewProvider {
    static var previews: some View {
        Border_RoundedCornersImages()
    }
}
