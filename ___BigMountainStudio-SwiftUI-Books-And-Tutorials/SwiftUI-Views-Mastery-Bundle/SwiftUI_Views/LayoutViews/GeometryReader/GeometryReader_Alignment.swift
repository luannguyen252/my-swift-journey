//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct GeometryReader_Alignment: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("GeometryReader", subtitle: "Alignment", desc: "Child views within the GeometryReader are aligned in the upper left corner by default.", back: .clear)
            
            GeometryReader {_ in
                Image(systemName: "arrow.up.left")
                    .padding()
            }
            .background(Color.pink)
        }
        .font(.title)
    }
}

struct GeometryReader_Alignment_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader_Alignment()
    }
}
