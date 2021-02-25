//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Image_ScaledMetricSymbol: View {
    @ScaledMetric var size: CGFloat = 32
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Image",
                       subtitle: "Scaled Metric",
                       desc: "Use the ScaledMetric property wrapper to adjust the size of a symbol in relation to the dynamic text size.",
                       back: .red, textColor: .primary)
            HStack {
                Image(systemName: "thermometer.sun")
                    .font(.system(size: size))
                Text("Grows with Text")
            }
            
        }
        .font(.title)
    }
}

struct Image_ScaledMetricSymbol_Previews: PreviewProvider {
    static var previews: some View {
        Image_ScaledMetricSymbol()
    }
}
