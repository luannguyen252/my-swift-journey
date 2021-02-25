//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Text_ScaledMetric: View {
    @ScaledMetric private var fontSize: CGFloat = 40
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Text",
                       subtitle: "ScaledMetric",
                       desc: "You can use the @ScaledMetric property wrapper to adjust some property in relation to the dynamic type increasing or decreasing.",
                       back: .green, textColor: .white)
            
            Text("Hello, World!")
                .font(.system(size: fontSize))
            
            DescView(desc: "Not using @ScaledMetric:", back: .green, textColor: .white)
            Text("Hello, World!")
                .font(.system(size: 40))
        }
        .font(.title)
    }
}

struct Text_ScaledMetric_Previews: PreviewProvider {
    static var previews: some View {
        Text_ScaledMetric()
    }
}
