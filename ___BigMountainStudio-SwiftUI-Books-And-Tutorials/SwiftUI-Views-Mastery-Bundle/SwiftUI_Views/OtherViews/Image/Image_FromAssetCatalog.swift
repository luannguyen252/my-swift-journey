//
//  Image_1_00.swift
//  100Views
//
//  Created by Mark Moeykens on 6/6/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Image_FromAssetCatalog : View {
    var body: some View {
        VStack(spacing: 20) {
                HeaderView("Image",
                           subtitle: "From Asset Catalog",
                           desc: "By default, your images retain their original size.",
                           back: .red)
            
            Image("SwiftUI.red.small")
            
            DescView(desc: "You can change the size by adding the resizable modifier.", back: .red)
            
            Image("SwiftUI.red.small")
                .resizable()
            
            DescView(desc: "By default, resizable will allow the image to expand to fill all available space.", back: .red)
        }
        .font(.title)
        .ignoresSafeArea(edges: .bottom)
        .minimumScaleFactor(0.5)
    }
}

struct Image_1_00_Previews : PreviewProvider {
    static var previews: some View {
        Image_FromAssetCatalog()
    }
}
