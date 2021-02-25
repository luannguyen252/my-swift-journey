//  Copyright © 2021 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct NavLink_InToolbarWorkaround: View {
    @State private var navigate = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HeaderView("",
                           subtitle: "Workaround with ToolbarItem",
                           desc: "Use a Button in the ToolbarItem and a NavigationLink with isActive to navigate.",
                           back: Color("Theme3ForegroundColor"),
                           textColor: Color("Theme3BackgroundColor"))
                NavigationLink(destination: Text("Settings"),
                               isActive: $navigate,
                               label: {})
            }
            .toolbar {
                ToolbarItem {
                    Button(action: { navigate = true }) {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
            .navigationTitle("NavigationLink")
            .font(.title)
        }
    }
}

struct NavLink_InToolbarWorkaround_Previews: PreviewProvider {
    static var previews: some View {
        NavLink_InToolbarWorkaround()
    }
}
