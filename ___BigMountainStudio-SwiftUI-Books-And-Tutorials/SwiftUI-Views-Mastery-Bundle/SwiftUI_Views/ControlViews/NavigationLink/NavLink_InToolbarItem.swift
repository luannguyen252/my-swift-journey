//  Copyright © 2021 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct NavLink_InToolbarItem: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HeaderView("",
                           subtitle: "In ToolbarItem",
                           desc: "Warning: Do not put NavigationLink inside a ToolbarItem.",
                           back: Color("Theme3ForegroundColor"),
                           textColor: Color("Theme3BackgroundColor"))
            }
            .toolbar {
                ToolbarItem {
                    // Do not do this
                    NavigationLink(destination: Text("Settings"),
                        label: {
                            Image(systemName: "slider.horizontal.3")
                        })
                }
            }
            .navigationTitle("NavigationLink")
            .font(.title)
        }
    }
}

struct NavLink_InToolbarItem_Previews: PreviewProvider {
    static var previews: some View {
        NavLink_InToolbarItem()
    }
}
