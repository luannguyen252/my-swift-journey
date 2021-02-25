//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct List_InsetGroupListStyle_WithSectionHeaderFooters: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("List",
                       subtitle: "InsetGroup - Headers & Footers",
                       desc: "This list style also changes the way headers and footers are rendered.",
                       back: .green)
                .font(.title)
            List {
                Section(header: Text("What would you like to learn?").font(.title3),
                        footer: Text("Count: 7")) {
                    Label("Learn Geography", systemImage: "signpost.right.fill")
                    Label("Learn Music", systemImage: "doc.richtext")
                    Label("Learn Photography", systemImage: "camera.aperture")
                    Label("Learn Art", systemImage: "paintpalette.fill")
                        .foregroundColor(.green)
                    Label("Learn Physics", systemImage: "atom")
                    Label("Learn 3D", systemImage: "cube.transparent")
                    Label("Learn Hair Styling", systemImage: "comb.fill")
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct List_InsetGroupListStyle_WithSectionHeaderFooters_Previews: PreviewProvider {
    static var previews: some View {
        List_InsetGroupListStyle_WithSectionHeaderFooters()
    }
}
