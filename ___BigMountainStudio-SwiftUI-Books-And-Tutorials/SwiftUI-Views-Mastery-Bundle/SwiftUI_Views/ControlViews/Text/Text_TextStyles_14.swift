//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Text_TextStyles_14: View {
    var body: some View {
        VStack(spacing: 40) {
            HeaderView("Text",
                       subtitle: "Additional Text Styles in iOS 14",
                       desc: "There are 3 more text styles introduced in iOS 14.",
                       back: .green, textColor: .white)
            
            Text("Font.title2 (iOS 14)").font(.title2)
            Text("Font.title3 (iOS 14)").font(.title3)
            Text("Font.caption2 (iOS 14)").font(.caption2)
        }
        .font(.title)
    }
}

struct Text_TextStyles_14_Previews: PreviewProvider {
    static var previews: some View {
        Text_TextStyles_14()
    }
}
