//
//  Mask_Examples.swift
//  100Views
//
//  Created by Mark Moeykens on 9/20/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Mask_Examples: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                Text("Mask")
                    .font(.largeTitle)
                Text("Examples")
                    .foregroundColor(.gray)
                
                Text("Use the mask to take an existing view and cut out a shape using another view.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.orange)
                    .foregroundColor(.black)
                
                Text("Use Shapes")
                Image("yosemite")
                    .mask(Capsule())
                
                Image("profile")
                    .mask(Circle())
                
                Text("Use Text")
                Image("yosemite")
                    .contrast(0.6)
                    .mask(Text("NATURE").fontWeight(.black).font(.system(size: 48)))
                
                Text("Use Another Image")
                Image("valley")
                    .mask(Image("Tree").resizable())
            }
            .font(.title)
        }
    }
}

struct Mask_Examples_Previews: PreviewProvider {
    static var previews: some View {
        Mask_Examples()
    }
}
