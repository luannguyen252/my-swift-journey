//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct AlignmentGuide_ComparedWithOffset: View {
    var body: some View {
        VStack(spacing: 25) {
            HeaderView("AlignmentGuide",
                       subtitle: "Compared with Offset",
                       desc: "Use the alignmentGuide modifier to position views in relation to a guide. Guides can be vertical or horizontal",
                       back: .red)
                .layoutPriority(1)
            Text("Using alignment guide")
            HStack {
                Image(systemName: "1.circle")
                    .alignmentGuide(VerticalAlignment.center) { _ in 20 }
                Image(systemName: "2.circle")
                    .alignmentGuide(VerticalAlignment.center) { _ in 0 }
                Image(systemName: "3.circle")
                    .alignmentGuide(VerticalAlignment.center) { _ in -20 }
            }
            .border(Color.red, width: 2)
            
            Text("Using offset")
            HStack {
                Image(systemName: "1.circle")
                    .offset(y: -20)
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
                    .offset(y: 20)
            }
            .border(Color.red, width: 2)
            
            DescView(desc: "Using alignment guides will move the frame of the view. Offset only moves the content (frame stays).", back: .red)
        }
        .font(.title)
    }
}

struct AlignmentGuide_ComparedWithOffset_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentGuide_ComparedWithOffset()
    }
}
