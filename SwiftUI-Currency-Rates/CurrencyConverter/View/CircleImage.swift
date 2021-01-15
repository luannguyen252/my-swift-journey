//
//  CircleImage.swift
//  CurrencyConverter
//
//  Created by Vincent Smithers on 13.06.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var width: CGFloat = 30.0
    var height: CGFloat = 30.0
    var body: some View {
        image
            .resizable()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
            .frame(width: width, height: height)
    }
}

#if DEBUG
struct CircleImage_Previews : PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image(systemName: "plus.circle"))
    }
}
#endif
