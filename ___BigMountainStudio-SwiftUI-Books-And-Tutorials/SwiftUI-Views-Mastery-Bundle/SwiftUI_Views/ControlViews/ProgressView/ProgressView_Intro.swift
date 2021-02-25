//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct ProgressView_Intro: View {
    var body: some View {
        VStack(spacing: 20.0) {
            HeaderView("ProgressView",
                       subtitle: "Introduction",
                       desc: "Use ProgressView to show that some activity is happening. if you do not pass in any values, it will just show an indeterminate spinner.",
                       back: .blue, textColor: .white)
            
            ProgressView()
            
            DescView(desc: "You can add a label to it as well:", back: .blue, textColor: .white)
            ProgressView("Loading...")
                .font(Font.system(.title2, design: .monospaced).weight(.bold))
            
            DescView(desc: "Which, as you can see, can be customized.", back: .blue, textColor: .white)
        }
        .font(.title)
    }
}

struct ProgressView_Intro_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView_Intro()
    }
}
