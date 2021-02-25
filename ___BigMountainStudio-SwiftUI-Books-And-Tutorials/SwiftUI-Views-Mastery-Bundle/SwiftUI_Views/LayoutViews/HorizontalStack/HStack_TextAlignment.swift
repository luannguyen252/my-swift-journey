//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct HStack_TextAlignment: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("HStack",
                       subtitle: "Text Alignment",
                       desc: "HStacks have another alignment option to help better align the bottom of text.",
                       back: .orange)
            
            HStack(alignment: .bottom) {
                Text("Hello")
                Text("amazing")
                    .font(.largeTitle)
                Text("developer!")
            }
            .font(.body)
            
            DescView(desc: "Notice the bottom of the text isn't really aligned above. Use firstTextBaseline or lastTextBaseline instead:", back: .orange)
            
            HStack(alignment: .firstTextBaseline) {
                Text("Hello")
                Text("amazing")
                    .font(.largeTitle)
                Text("developer!")
            }
            .font(.body)
        }
        .font(.title)
    }
}

struct HStack_TextAlignment_Previews: PreviewProvider {
    static var previews: some View {
        HStack_TextAlignment()
    }
}
