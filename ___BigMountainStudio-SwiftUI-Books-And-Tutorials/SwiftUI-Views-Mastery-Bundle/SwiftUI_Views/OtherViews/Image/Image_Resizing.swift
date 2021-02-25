//
//  Image_1_01_Resizable.swift
//  100Views
//
//  Created by Mark Moeykens on 6/6/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Image_Resizing : View {
    var body: some View {
        VStack(spacing: 5) {
            HeaderView("Image",
                       subtitle: "Resizing",
                       desc: "With the resizable modifier, you can then adjust the frame to resize.",
                       back: .red, textColor: .primary)
            Image("SwiftUI")
                .resizable()
                .frame(width: 100.0, height: 100.0)
            
            Text("No Scaling")
            Image("SwiftUI")
                .resizable()
                .frame(width: 100.0, height: 150.0)
                .background(Color.primary)
            
            Text("Scaled to Fit")
            Image("SwiftUI")
                .resizable()
                .scaledToFit()
                .background(Color.primary)
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct Image_Resizing_Previews : PreviewProvider {
    static var previews: some View {
        Image_Resizing()
    }
}
