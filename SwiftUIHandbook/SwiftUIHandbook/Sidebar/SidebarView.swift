//
//  SidebarView.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct SidebarView: View {
    // MARK: - BODY
    var body: some View {
        #if os(iOS)
        SideBarContent()
            .navigationTitle("Code")
        #else
        SideBarContent()
            .frame(minWidth: 200, idealWidth: 250,maxWidth: 300)
        #endif
    }
}

// MARK: - SIDEBAR CONTENT
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

// MARK: - PREVIEW
struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
