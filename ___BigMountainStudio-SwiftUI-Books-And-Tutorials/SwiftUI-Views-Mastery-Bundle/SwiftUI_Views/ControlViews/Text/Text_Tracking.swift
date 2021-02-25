//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Text_Tracking: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Text",
                       subtitle: "Tracking",
                       desc: "Tracking is used to increase or decrease space uniformly between all letters.",
                       back: .green, textColor: .white)
            
            Text("Normal Tracking")
            
            DescView(desc: ".tracking(-2)", back: .green, textColor: .white)
            Text("Decreased Tracking")
                .tracking(-2)
            
            DescView(desc: ".tracking(8)", back: .green, textColor: .white)
            Text("Increased Tracking")
                .tracking(8)
        }
        .font(.title)
    }
}

struct Text_Tracking_Previews: PreviewProvider {
    static var previews: some View {
        Text_Tracking()
    }
}
