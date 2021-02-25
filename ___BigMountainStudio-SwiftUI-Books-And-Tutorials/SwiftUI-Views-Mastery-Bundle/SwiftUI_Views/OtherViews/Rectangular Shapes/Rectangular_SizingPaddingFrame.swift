//
//  Rectangular_Size.swift
//  100Views
//
//  Created by Mark Moeykens on 7/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Rectangular_SizingPaddingFrame : View {
    var body: some View {
        VStack(spacing: 5) {
            Text("Rectangular Shapes").font(.largeTitle)
            Text("Sizing").foregroundColor(.gray)
            Text("Use modifiers, such as padding or frame, to size rectangular shapes as you see fit.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue)
            
            Text("Using padding")
            ZStack {
                Rectangle().padding(8)
                Rectangle().padding(25)
                    .colorInvert()
                Rectangle().padding(45)
                Rectangle().padding(70)
                    .colorInvert()
            }.frame(width: 180, height: 180)
            
            Text("Using frames")
            ZStack(alignment: .bottomLeading) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.secondary)
                    .frame(width: 320, height: 220)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.secondary)
                    .frame(width: 270, height: 170)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.secondary)
                    .frame(width: 220, height: 120)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.secondary)
                    .frame(width: 170, height: 70)
            }
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct Rectangular_SizingPaddingFrame_Previews : PreviewProvider {
    static var previews: some View {
        Rectangular_SizingPaddingFrame()
    }
}
