//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Image_ScaledMetricImage: View {
    @ScaledMetric var size: CGFloat = 32
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Image",
                       subtitle: "Scaled Metric",
                       desc: "Use the ScaledMetric property wrapper to adjust the size of an image in relation to the dynamic text size.",
                       back: .red, textColor: .primary)
            HStack {
                Image("SwiftUI")
                    .resizable()
                    .frame(width: size, height: size)
                Text("Grows with Text")
            }
            
        }
        .font(.title)
    }
}

struct Image_ScaledMetricImage_Previews: PreviewProvider {
    static var previews: some View {
        Image_ScaledMetricImage()
    }
}
