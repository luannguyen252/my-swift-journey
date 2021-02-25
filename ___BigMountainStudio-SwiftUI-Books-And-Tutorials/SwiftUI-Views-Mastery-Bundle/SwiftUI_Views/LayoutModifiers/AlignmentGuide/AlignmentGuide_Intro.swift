//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct AlignmentGuide_Intro: View {
    var body: some View {
        VStack(spacing: 40) {
            HeaderView("AlignmentGuide",
                       subtitle: "Introduction",
                       desc: "Use the alignmentGuide modifier to position views in relation to a guide. Guides can be vertical or horizontal.",
                       back: .red)
            Text("Use Vertical Guides in HStacks")
            ZStack {
                HStack {
                    Image(systemName: "1.circle")
                        .alignmentGuide(VerticalAlignment.center) { _ in 20 }
                    Image(systemName: "2.circle")
                        .alignmentGuide(VerticalAlignment.center) { _ in 0 }
                    Image(systemName: "3.circle")
                        .alignmentGuide(VerticalAlignment.center) { _ in -20 }
                }
                Divider().background(Color.red)
            }
            
            Text("Use Horizontal Guides in VStacks")
            ZStack {
                VStack(spacing: 10) {
                    Image(systemName: "1.circle")
                        .alignmentGuide(HorizontalAlignment.center) { _ in 20 }
                    Image(systemName: "2.circle")
                        .alignmentGuide(HorizontalAlignment.center) { _ in 0 }
                    Image(systemName: "3.circle")
                        .alignmentGuide(HorizontalAlignment.center) { _ in -20 }
                }
                HStack {
                    Divider().background(Color.red)
                }
            }
            .frame(height: 200)
        }
        .font(.title)
    }
}

struct AlignmentGuide_Intro_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentGuide_Intro()
    }
}
