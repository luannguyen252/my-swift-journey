//
//  ImagePaints.swift
//  Drawing
//
//  Created by Sandesh on 31/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI
/*
 ImagePaint: - Struct confirming shape style, wraps the image, giving us the total control of the image rendering
 
 //from hacking with swift
 The type is called ImagePaint, and it’s created using one to three parameters. At the very least you need to give it an Image to work with as its first parameter, but you can also provide a rectangle within that image to use as the source of your drawing specified in the range of 0 to 1 (the second parameter), and a scale for that image (the third parameter). Those second and third parameters have sensible default values of “the whole image” and “100% scale”, so you can sometimes ignore them.
 
 */
struct ImagePaints: View {
    
    var body: some View {
        Capsule()
            
            .strokeBorder(ImagePaint(image: Image("sandesh"), scale: 0.05), lineWidth: 30)
            .frame(width: 200, height: 100, alignment: .center)
    }
}

struct ImagePaints_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaints()
    }
}
