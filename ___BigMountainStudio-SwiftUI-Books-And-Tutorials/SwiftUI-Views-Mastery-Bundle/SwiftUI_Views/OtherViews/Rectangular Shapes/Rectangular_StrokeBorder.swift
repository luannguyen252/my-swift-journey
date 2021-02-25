//
//  Rectangular_StrokeBorder.swift
//  100Views
//
//  Created by Mark Moeykens on 7/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Rectangular_StrokeBorder : View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Rectangular Shapes").font(.largeTitle)
            Text("Stroke Border (Inner Stroke)")
                .font(.title).foregroundColor(.gray)
            Text("A stroke modifier grows outward from the center of the shape's outline and can cause overlapping issues.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue)
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.orange, lineWidth:  40)
                RoundedRectangle(cornerRadius: 40)
                    .stroke() // outline
            }
            Text("A strokeBorder modifier will grow inward from the shape's outline.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue)
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                    .strokeBorder(Color.orange, lineWidth:  40)
                RoundedRectangle(cornerRadius: 40)
                    .stroke() // outline
            }
            Text("(Notice how .strokeBorder will start to square off inside when the lineWidth increases.)")
                .font(.body)
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct Rectangular_StrokeBorder_Previews : PreviewProvider {
    static var previews: some View {
        Rectangular_StrokeBorder()
    }
}
