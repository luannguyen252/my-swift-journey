//
//  Mask_WithShapes.swift
//  100Views
//
//  Created by Mark Moeykens on 9/20/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Mask_WithShapesPadding: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Mask")
                .font(.largeTitle)
            
            Text("With Shapes & Padding")
                .foregroundColor(.gray)
            
            Text("You can mask only part of the image by combining padding with a shape.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundColor(.black)
            
            Image("profile")
                // Add padding to sides of the shape to control what is masked
                .mask(Rectangle().padding(.bottom, 20))
                .border(Color.orange)
            
            Image("profile")
                .mask(Rectangle().padding(.top, 80))
                .border(Color.orange)
            
            Image("yosemite")
                .mask(Rectangle().padding(.horizontal, 50))
                .border(Color.orange)
        }
        .font(.title)
    }
}

struct Mask_WithShapesPadding_Previews: PreviewProvider {
    static var previews: some View {
        Mask_WithShapesPadding()
    }
}
