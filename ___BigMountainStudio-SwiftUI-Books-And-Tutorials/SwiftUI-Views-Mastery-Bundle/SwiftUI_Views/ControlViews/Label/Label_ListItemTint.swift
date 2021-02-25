//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Label_ListItemTint: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Label",
                       subtitle: "List Item Tint",
                       desc: "In iOS, you can apply a tint color but it will have no effect unless you apply the SidebarListStyle.",
                       back: .pink)
                .font(.title)
            List {
                Label("Edit", systemImage: "rectangle.and.pencil.and.ellipsis")
                    .listItemTint(.pink)
                Label("Archives", systemImage: "archivebox.circle")
                    .listItemTint(.orange)
                Label("Document", systemImage: "doc.richtext")
                    .listItemTint(.red)
                Label("Camera Settings", systemImage: "camera.badge.ellipsis")
                    .listItemTint(.purple)
            }
            Divider()
            Text("SidebarListStyle:")
            List {
                Label("Edit", systemImage: "rectangle.and.pencil.and.ellipsis")
                    .listItemTint(.pink)
                Label("Archives", systemImage: "archivebox.circle")
                    .listItemTint(.orange)
                Label("Document", systemImage: "doc.richtext")
                    .listItemTint(.purple)
                Label("Camera Settings", systemImage: "camera.badge.ellipsis")
                    .listItemTint(.monochrome)
            }
            .listStyle(SidebarListStyle())
        }
    }
}

struct Label_ListItemTint_Previews: PreviewProvider {
    static var previews: some View {
        Label_ListItemTint()
    }
}
