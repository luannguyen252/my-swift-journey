//
//  Sidebar.swift
//  Game-of-Thrones-SwiftUI
//
//  Created by Christian Elies on 22.07.20.
//  Copyright © 2020 Christian Elies. All rights reserved.
//

import SwiftUI

struct Sidebar: View {
    @Binding var selection: NavigationItem?
    @Binding var selectedHouse: HouseMetadataModel?

    var body: some View {
        List(selection: $selection) {
            #if os(macOS)
            Label("Houses", systemImage: "house").tag(NavigationItem.houses)
            #else
            NavigationLink(destination: HouseListScreen(selectedHouse: $selectedHouse)) {
                Label("Houses", systemImage: "house")
            }
            #endif
            Label("Characters", systemImage: "person").tag(NavigationItem.characters)
            Label("Books", systemImage: "book").tag(NavigationItem.books)
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Overview")
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar(selection: .constant(nil), selectedHouse: .constant(nil))
    }
}
