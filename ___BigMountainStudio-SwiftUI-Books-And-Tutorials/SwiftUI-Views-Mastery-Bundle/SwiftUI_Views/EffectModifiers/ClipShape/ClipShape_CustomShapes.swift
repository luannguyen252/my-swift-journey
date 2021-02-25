//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct ClipShape_CustomShapes: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("banff")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(WavyBottomRectangle(waveLength: 20))
                .shadow(radius: 4, y: 4)
            
            HeaderView("ClipShape", subtitle: "With Custom Shapes", desc: "Your custom shapes can also be used to clip or mask images using the clipShape modifier.",
                       back: .blue, textColor: .white)
            Spacer()
        }
        .font(.title)
        .ignoresSafeArea(edges: .top)
    }
}

struct ClipShape_CustomShapes_Previews: PreviewProvider {
    static var previews: some View {
        ClipShape_CustomShapes()
    }
}
