//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct List_SidebarListStyle_WithSectionHeaderFooters: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("List",
                       subtitle: "Sidebar - Headers & Footers",
                       desc: "This list style also changes the way headers and footers are rendered.",
                       back: .green)
            List {
                Section(header: Text("What would you like to learn?").font(.title2),
                        footer: Text("Count: 7")) {
                    Label("Learn Geography", systemImage: "signpost.right.fill")
                    Label("Learn Music", systemImage: "doc.richtext")
                    Label("Learn Photography", systemImage: "camera.aperture")
                    Label("Learn Art", systemImage: "paintpalette.fill")
                        .font(Font.system(.title3).weight(.bold))
                    Label("Learn Physics", systemImage: "atom")
                    Label("Learn 3D", systemImage: "cube.transparent")
                    Label("Learn Hair Styling", systemImage: "comb.fill")
                }
            }
            .listStyle(SidebarListStyle())
            .accentColor(.green)
        }
        .font(.title)
    }
}

struct List_SidebarListStyle_WithSectionHeaderFooters_Previews: PreviewProvider {
    static var previews: some View {
        List_SidebarListStyle_WithSectionHeaderFooters()
    }
}
