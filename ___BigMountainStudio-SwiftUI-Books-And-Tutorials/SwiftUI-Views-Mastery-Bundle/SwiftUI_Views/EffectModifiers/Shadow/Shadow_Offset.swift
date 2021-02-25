//
//  Shadow_Offset.swift
//  100Views
//
//  Created by Mark Moeykens on 9/8/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Shadow_Offset: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Shadow").font(.largeTitle)
            Text("Offset").font(.title).foregroundColor(.gray)
            Text("Use the x and y parameters to change the location of the shadow.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.blue)
                .minimumScaleFactor(0.5)
                .foregroundColor(.white)
            
            Group {
                Circle()
                    .fill(Color.blue)
                    .shadow(radius: 1, x: 8, y: -8)
                    .overlay(Text("x:8, y:-8"))
                Circle()
                    .fill(Color.blue)
                    .shadow(radius: 1, x: 8, y: 8)
                    .overlay(Text("x:8, y:8"))
                Circle()
                    .fill(Color.blue)
                    .shadow(radius: 1, x: -8, y: 8)
                    .overlay(Text("x:-8, y:8"))
                Circle()
                    .fill(Color.blue)
                    .shadow(radius: 1, x: -8, y: -8)
                    .overlay(Text("x:-8, y:-8"))
            }
            .font(.title)
            .foregroundColor(.white)
        }
    }
}

struct Shadow_Offset_Previews: PreviewProvider {
    static var previews: some View {
        Shadow_Offset()
    }
}
