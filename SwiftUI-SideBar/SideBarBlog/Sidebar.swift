//
//  Sidebar.swift
//  SideBarBlog
//
//  Created by Thomas Prezioso on 9/18/20.
//

import SwiftUI

struct Sidebar: View {
    var body: some View {
//        NavigationView {
            #if os(iOS)
            SideBarContent()
                .navigationTitle("Code")
            #else
            SideBarContent()
                .frame(minWidth: 200, idealWidth: 250,maxWidth: 300)
            #endif
//        }

    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}

struct SideBarContent: View {
    var body: some View {
        List {
            Label("Books", systemImage: "book.closed")
            Label("Tutorials", systemImage: "list.bullet.rectangle")
            Label("Video Tutorials", systemImage: "tv")
            Label("Contacts", systemImage: "mail.stack")
            Label("Search", systemImage: "magnifyingglass")
        }
        .listStyle(SidebarListStyle())
    }
}
