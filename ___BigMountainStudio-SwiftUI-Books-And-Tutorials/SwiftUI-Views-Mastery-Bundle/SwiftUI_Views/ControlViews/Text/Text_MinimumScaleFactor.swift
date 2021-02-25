//
//  Text_2_0_Shrinking.swift
//  100Views
//
//  Created by Mark Moeykens on 6/9/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Text_MinimumScaleFactor : View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Text")
                .font(.largeTitle)
            Text("Minimum Scale Factor")
                .font(.title)
                .foregroundColor(.gray)
            Image("AllowsTightening")
            Text(".allowsTightening(true) is being used here:")
                .frame(maxWidth: .infinity).padding()
                .background(Color.green).foregroundColor(Color.white)
                .font(.title)
            
            Text("Sometimes you want to shrink text if long")
                .allowsTightening(true) // Tighten letter spacing
                .font(.title)
                .lineLimit(1)
            Text("Allows tightening is failing here because the text is too long. In this case, you can apply a minimum scale factor and specify by how much you want to allow the text to shrink.")
                .padding(.horizontal)
            
            Image("MinimumScaleFactor")
            Text(".minimumScaleFactor(0.5) is being used here:")
                .frame(maxWidth: .infinity).padding()
                .background(Color.green).foregroundColor(Color.white)
                .font(.title)
            
            Text("Sometimes you want to shrink text if long")
                .font(.title)
                .minimumScaleFactor(0.5) // Allow to shrink to 50% of its size
            
            Text(".minimumScaleFactor takes a fraction from 0 to 1. For example, 0.3 is 30% of the original size of the font that it can shrink. If the font size is 100, then it can shrink to 30.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(Color.white)
        }
        .minimumScaleFactor(0.6)
    }
}

struct Text_MinimumScaleFactor_Previews : PreviewProvider {
    static var previews: some View {
        Text_MinimumScaleFactor()
    }
}
