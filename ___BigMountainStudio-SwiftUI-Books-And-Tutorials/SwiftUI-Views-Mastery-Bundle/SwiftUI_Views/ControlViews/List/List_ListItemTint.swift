//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct List_ListItemTint: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("List",
                       subtitle: "ListItemTint",
                       desc: "ListItemTint is used to apply a color to Labels within your List but it only works on certain list styles.",
                       back: .green)
                .font(.title)
                .layoutPriority(1)
            
            Text("List").bold()
            List {
                Label("Learn Photography", systemImage: "camera.aperture")
                    .listItemTint(Color.red)
            }
            
            Text("SidebarListStyle").bold()
            List {
                Label("Learn Photography", systemImage: "camera.aperture")
                    .listItemTint(Color.red)
            }
            .listStyle(SidebarListStyle())
            
            Text("GroupedListStyle").bold()
            List {
                Label("Learn Photography", systemImage: "camera.aperture")
                    .listItemTint(Color.red)
            }
            .listStyle(GroupedListStyle())
            
            Text("InsetGroupedListStyle").bold()
            List {
                Label("Learn Photography", systemImage: "camera.aperture")
                    .listItemTint(Color.red)
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct List_ListItemTint_Previews: PreviewProvider {
    static var previews: some View {
        List_ListItemTint()
    }
}
