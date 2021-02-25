//
//  ImagePaint_Strokes.swift
//  100Views
//
//  Created by Mark Moeykens on 7/13/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ImagePaint_Strokes : View {
    var body: some View {
        let imgPaint = ImagePaint(image: Image("repeatableImage"))
        let imgPaintInverse = ImagePaint(image: Image("repeatableImageInverse"), scale: 0.5)
        
        return ZStack {
            Rectangle()
                .fill(imgPaint)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("ImagePaint")
                    .font(.system(.largeTitle, design: .serif))
                Text("With Stokes").foregroundColor(.gray)
                    .font(.system(.title, design: .serif))
                Text("Since ImagePaint is a ShapeStyle, we can also apply it to the border of shapes")
                    .frame(maxWidth: .infinity).padding()
                    .background(Color.black).foregroundColor(Color.yellow)
                    .font(.system(.title, design: .serif))
                Circle()
                    .strokeBorder(imgPaintInverse, lineWidth: 50, antialiased: true)
                    .shadow(color: Color.black, radius: 20, x: 10, y: 10)
                    .padding()
                Text("Note: The image paint is created from an image at 50% scale. Also, remember that the strokeBorder modifier starts from the border of the shape and goes inward.")
                    .frame(maxWidth: .infinity).padding()
                    .background(Color.black).foregroundColor(Color.yellow)
                    .font(.system(.body, design: .serif))
            }
        }
    }
}

struct ImagePaint_Strokes_Previews : PreviewProvider {
    static var previews: some View {
        ImagePaint_Strokes()
    }
}
