//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Redacted_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Redacted",
                       subtitle: "Introduction",
                       desc: "Use the redacted modifier to show placeholder views instead of actual content.",
                       back: .purple, textColor: .white)
            
            Text("Text Redacted Text Redacted Text Redacted")
                .redacted(reason: .placeholder)
            
            Text("Text Not Redacted")
            
            DescView(desc: "Images can also be redacted.", back: .purple, textColor: .white)
            
            HStack {
                Text("Redacted")
                Image("profile")
                    .redacted(reason: .placeholder)
            }
            HStack {
                Text("Original")
                Image("profile")
            }
        }
        .font(.title)
    }
}

struct Redacted_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Redacted_Intro()
    }
}
