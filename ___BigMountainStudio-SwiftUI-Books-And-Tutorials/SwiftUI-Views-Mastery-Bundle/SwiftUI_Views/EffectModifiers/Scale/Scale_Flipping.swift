//
//  Scale_Flipping.swift
//  100Views
//
//  Created by Mark Moeykens on 9/4/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Scale_Flipping: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                Text("Scale Effect").font(.largeTitle)
                Text("Flip Views").font(.title).foregroundColor(.gray)
                Text("You flip views horizontally or vertically using negative values.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.pink)
                    .layoutPriority(1)
                
                Group {
                    Text("Flip Horizontally")
                        .font(.title)
                        .scaleEffect(x: -1, y: 1)
                    
                    Text("Flip Vertically")
                        .font(.title)
                        .scaleEffect(x: 1, y: -1)
                    
                    Text("Original Image")
                    Image("yosemite")
                        .scaleEffect(x: 1, y: 1)
                    
                    Text("Flip Horizontally")
                    Image("yosemite")
                        .scaleEffect(x: -1, y: 1)
                    
                    Text("Flip Vertically")
                    Image("yosemite")
                        .scaleEffect(x: 1, y: -1)
                    
                    Text("Flip Vertically and Horizontally")
                    Image("yosemite")
                        .scaleEffect(x: -1, y: -1)
                }
            }
        }
    }
}

struct Scale_Flipping_Previews: PreviewProvider {
    static var previews: some View {
        Scale_Flipping()
    }
}
