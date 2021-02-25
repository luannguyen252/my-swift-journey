//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Redacted_MoreViews: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Redacted",
                       subtitle: "More Views",
                       desc: "Here are some other views that are also affected by the redacted modifier.",
                       back: .purple, textColor: .white)
            
            VStack(spacing: 20) {
                Text("Buttons")
                Button("Redact this Button", action: {})
                    .redacted(reason: .placeholder)
                
                Text("Labels")
                Label(
                    title: { Text("Redacted Label") },
                    icon: { Image(systemName: "wifi") })
                    .redacted(reason: .placeholder)
                
                Text("Links")
                Link("Go to Apple", destination: URL(string: "https://www.apple.com")!)
                    .accentColor(.purple)
                    .redacted(reason: .placeholder)
            }
            .padding(.horizontal)
        }
        .font(.title)
    }
}

struct Redacted_MoreViews_Previews: PreviewProvider {
    static var previews: some View {
        Redacted_MoreViews()
    }
}
