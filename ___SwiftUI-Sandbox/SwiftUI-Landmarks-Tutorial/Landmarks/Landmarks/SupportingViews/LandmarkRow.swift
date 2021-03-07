//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Nicholas Fox on 6/3/19.
//  Copyright © 2019 Nick Fox. All rights reserved.
//

import SwiftUI

struct LandmarkRow : View {

    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image(forSize: 50)
            Text(verbatim: landmark.name)
            Spacer()

            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.large)
                    .foregroundColor(.yellow)
            }
        }
    }
}

#if DEBUG
struct LandmarkRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarkData[0])
            LandmarkRow(landmark: landmarkData[5])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
