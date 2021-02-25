//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Toolbar_Intro: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HeaderView("",
                           subtitle: "Introduction",
                           desc: "Use the toolBar modifier to create ToolbarItems (buttons) that will show up inside a NavigationView.",
                           back: .green)
                
                Spacer()
            }
            .navigationTitle("Toolbar")
            .font(.title)
            .toolbar {
                ToolbarItem {
                    Button(action: {}) {
                        Image(systemName: "aspectratio")
                    }
                }
            }
        }
        .accentColor(.green)
    }
}

struct Toolbar_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Toolbar_Intro()
    }
}
