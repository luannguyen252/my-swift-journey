//
//  Mask_Offset.swift
//  100Views
//
//  Created by Mark Moeykens on 9/20/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Mask_Positioning: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                HeaderView("Mask",
                           subtitle: "Positioning",
                           desc: "Your mask will be positioned in the center by default. You can offset the mask within the image's frame.", back: .orange)
                HStack {
                    Spacer()
                    Text("Default")
                    Spacer()
                    Text("Repositioned")
                    Spacer()
                }
                HStack(spacing: 60) {
                    Image("profile")
                        .mask(Image(systemName: "heart.fill"))
                    Image("profile")
                        // Add an offset to the mask to move left
                        .mask(Image(systemName: "heart.fill").offset(x: -5))
                }.font(.system(size: 90))
                
                Text("Default")
                Image("yosemite")
                    .mask(Image(systemName: "tv.fill")
                            .font(.system(size: 75)))
                Text("Repositioned")
                Image("yosemite")
                    .mask(Image(systemName: "tv.fill")
                            .offset(x: 40)
                            .font(.system(size: 75)))
            }
            .font(.title)
        }
    }
}

struct Mask_Positioning_Previews: PreviewProvider {
    static var previews: some View {
        Mask_Positioning()
    }
}
