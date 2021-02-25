//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Redacted_Unredacted: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Redacted",
                       subtitle: "Using Unredacted",
                       desc: "You can also un-redact text that's been redacted.",
                       back: .purple, textColor: .white)
            
            VStack(spacing: 20) {
                Text("Redact this")
                Text("Redact this")
                Text("Redact this too")
                Text("Don't redact this")
                    .unredacted()
                Text("Redact this")
            }
            .redacted(reason: .placeholder)
        }
        .font(.title)
    }
}

struct Redacted_Unredacted_Previews: PreviewProvider {
    static var previews: some View {
        Redacted_Unredacted()
    }
}
