//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct HStack_TextAlignment_FirstLast: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("HStack",
                       subtitle: "First & Last Text Alignment",
                       desc: "The firstTextBaseline will align the bottom of the text on the first lines (\"Amazing\" and \"Really\").",
                       back: .orange)
            
            HStack(alignment: .firstTextBaseline) {
                Text("Amazing developer")
                    .font(.title3)
                Text("Really amazing developer")
            }
            .frame(width: 250)
            
            DescView(desc: "The lastTextBaseline will align the bottom of the text on the last lines (\"developer\" and \"developer\").", back: .orange)
            
            HStack(alignment: .lastTextBaseline) {
                Text("Amazing developer")
                    .font(.title3)
                Text("Really amazing developer")
            }
            .frame(width: 250)
        }
        .font(.title)
    }
}

struct HStack_TextAlignment_FirstLast_Previews: PreviewProvider {
    static var previews: some View {
        HStack_TextAlignment_FirstLast()
    }
}
