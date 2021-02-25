//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Toolbar_InlineNavBar: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HeaderView("",
                           subtitle: "Inline Nav Bar",
                           desc: "A toolbar item will also appear in an inline nav bar by default but ONLY one will show.",
                           back: .green)
                
                Spacer()
            }
            .navigationTitle("Toolbar")
            .navigationBarTitleDisplayMode(.inline)
            .font(.title)
            .toolbar {
                ToolbarItem {
                    Button(action: {}) {
                        Image(systemName: "aspectratio")
                    }
                }
                ToolbarItem {
                    Button(action: {}) {
                        Image(systemName: "camera.filters")
                    }
                }
            }
        }
        .accentColor(.green)
    }
}

struct Toolbar_InlineNavBar_Previews: PreviewProvider {
    static var previews: some View {
        Toolbar_InlineNavBar()
    }
}
