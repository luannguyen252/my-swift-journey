//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct DisclosureGroup_WithCustomLabel: View {
    @State private var sunExpanded = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("DisclosureGroup",
                       subtitle: "Custom Label Views",
                       desc: "You can use a custom view for the disclosure group's label by using a different initializer.",
                       back: .orange)
            
            DisclosureGroup(
                isExpanded: $sunExpanded,
                content: {
                    HStack(spacing: 40) {
                        Image(systemName: "sunrise.fill")
                        Image(systemName: "sun.min.fill")
                        Image(systemName: "sun.max.fill")
                        Image(systemName: "sunset.fill")
                    }
                    .padding(24)
                    .background(RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.orange)
                                    .opacity(0.1))
                },
                label: {
                    HStack(spacing: 20) {
                        Image(systemName: "sun.max")
                        Text("Sun")
                    }
                })
                .padding(.horizontal)
            Spacer()
        }
        .font(.title)
    }
}

struct DisclosureGroup_WithCustomLabel_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroup_WithCustomLabel()
    }
}
