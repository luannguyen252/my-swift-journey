//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct DisclosureGroup_Intro: View {
    @State private var disclosureExpanded = true
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("DisclosureGroup",
                       subtitle: "Introduction",
                       desc: "Use the DisclosureGroup when you want to expand or collapse other views.",
                       back: .orange)
            
            VStack(spacing: 20) {
                DisclosureGroup(
                    content: { Text("Disclosure groups are closed by default. Bind to a State variable to open the group.") },
                    label: { Text("More Info").bold() }
)
                DisclosureGroup("Accent Color", isExpanded: $disclosureExpanded) {
                    Text("You can change the color of the chevron with the use of the accentColor modifier.")
                        .font(.title2)
                        .padding()
                }
                .accentColor(.orange)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20)
                                .fill(Color.orange)
                                .opacity(0.1))
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .font(.title)
    }
}

struct DisclosureGroup_Intro_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroup_Intro()
    }
}
