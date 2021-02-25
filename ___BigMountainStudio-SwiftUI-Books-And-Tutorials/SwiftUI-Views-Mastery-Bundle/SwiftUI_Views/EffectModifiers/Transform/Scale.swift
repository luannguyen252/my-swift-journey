//
//  Scale.swift
//  100Views
//
//  Created by Mark Moeykens on 9/6/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Scale: View {
    @State private var applyEffect = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Transform Effect").font(.largeTitle)
            Text("Scale").font(.title).foregroundColor(.gray)
            Text("Resize a view using the scale transform effect.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .layoutPriority(1)
                .foregroundColor(.white)
            
            Spacer()
            Image(systemName: "flame")
                .border(Color.purple)
                .font(.system(size: 100))
                .foregroundColor(.purple)
                .transformEffect(applyEffect
                    ? CGAffineTransform(scaleX: 2, y: 2)
                    : .identity) // Identify removes all transformations
                .border(Color.purple)
            
            Spacer()
            
            Text("Notice the symbol scaled from the top leading corner. At this time, I'm not sure how to change the anchor through SwiftUI.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .layoutPriority(1)
                .foregroundColor(.white)
            
            HStack {
                Spacer()
                Button("Apply Effect") {
                    self.applyEffect = true
                }
                Spacer()
                Button("Remove Effect") {
                    self.applyEffect = false
                }
                Spacer()
            }
        }
    }
}

struct Scale_Previews: PreviewProvider {
    static var previews: some View {
        Scale()
    }
}
