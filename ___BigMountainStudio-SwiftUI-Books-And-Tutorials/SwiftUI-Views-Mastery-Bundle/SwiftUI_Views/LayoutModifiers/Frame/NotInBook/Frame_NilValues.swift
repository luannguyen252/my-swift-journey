//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Frame_NilValues: View {
    var body: some View {
        VStack {
            Color.red
                .frame(width: 100, height: 100)
                .frame(width: nil, height: nil) // No effect. Uses the original height and width.
        }
    }
}

struct Frame_NilValues_Previews: PreviewProvider {
    static var previews: some View {
        Frame_NilValues()
    }
}
