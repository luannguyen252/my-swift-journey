//
//  Preview_Landscape.swift
//  100Views
//
//  Created by Mark Moeykens on 9/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Preview_Landscape: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Previews").font(.largeTitle)
            Text("Landscape").foregroundColor(.gray)
            Text("You currently cannot rotate a previewed device. But one option is to set a fixed width and height for your preview.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .layoutPriority(1)
                .foregroundColor(.white)
        }.font(.title)
    }
}

struct Preview_Landscape_Previews: PreviewProvider {
    static var previews: some View {
        Preview_Landscape()
            .previewLayout(PreviewLayout.fixed(width: 896, height: 414))
    }
}
