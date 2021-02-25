//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct List_SidebarListStyle_FooterMissingBug: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Sidebar - Headers & Footers")
                .font(.largeTitle)
                       Text("The footer used to show before Xcode 12, Beta 2.")
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
            
            Text("100").underline()
                + Text(" SWIFTUI ").font(.largeTitle).fontWeight(.light).underline()
                .foregroundColor(.blue)
                + Text ("VIEWS").underline()
        }
        .font(.title)
    }
}

struct List_SidebarListStyle_FooterMissingBug_Previews: PreviewProvider {
    static var previews: some View {
        List_SidebarListStyle_FooterMissingBug()
    }
}
