//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Form_WithDisclosureGroup: View {
    @State private var settingsExpanded = true
    @State private var trebleOn = true
    @State private var bassOn = false
    @State private var levels = 0.5
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Form",
                       subtitle: "With Disclosure Groups",
                       desc: "You can add disclosure groups to a form to allow users to expand into more settings or views.",
                       back: .purple, textColor: .white)
            
            Form {
                DisclosureGroup("Audio Settings", isExpanded: $settingsExpanded) {
                    VStack {
                        Toggle("Treble", isOn: $trebleOn)
                        Toggle("Bass", isOn: $bassOn)
                        Slider(value: $levels)
                    }
                    .font(.title2)
                    .padding()
                }
            }
        }
        .font(.title)
        .accentColor(.purple)
    }
}

struct Form_WithDisclosureGroup_Previews: PreviewProvider {
    static var previews: some View {
        Form_WithDisclosureGroup()
    }
}
