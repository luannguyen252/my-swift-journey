//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Scrollview_Horizontal_Circles: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(0..<10) { index in
                        Circle()
                            .fill(Color.yellow)
                            .frame(width: 80, height: 80)
                    }
                }
            }
        }
    }
}

struct Scrollview_Horizontal_Circles_Previews: PreviewProvider {
    static var previews: some View {
        Scrollview_Horizontal_Circles()
    }
}
