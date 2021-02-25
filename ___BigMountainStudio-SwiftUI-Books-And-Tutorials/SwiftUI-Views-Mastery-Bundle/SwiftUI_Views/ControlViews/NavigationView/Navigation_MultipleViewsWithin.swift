//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Navigation_MultipleViewsWithin: View {
    var body: some View {
        NavigationView {
            // Sidebar
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
            
            // Main View
            VStack(spacing: 20) {
                HeaderView("NavigationView",
                           subtitle: "Sidebar view",
                           desc: "In iPadOS you can now add a three views with the first view becoming the sidebar.",
                           back: Color("Theme3ForegroundColor"), textColor: .white)
                
                Spacer()
            }
            .font(.title)
            
            // Detail View
            VStack {
                HStack {
                    Label("Learn Art", systemImage: "paintpalette.fill")
                        .font(Font.system(.largeTitle).weight(.bold))
                    Spacer()
                }
                .padding()
                
                Spacer()
            }
        }
        .navigationTitle("Side Bar")
    }
}

struct Navigation_MultipleViewsWithin_Previews: PreviewProvider {
    static var previews: some View {
        Navigation_MultipleViewsWithin()
            .previewDevice("iPad Pro (12.9-inch) (4th generation)")
    }
}
