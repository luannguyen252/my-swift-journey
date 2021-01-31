//
//  OutlineGroups.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct OutlineGroups: View {
    // MARK: - BODY
    var body: some View {
        List {
            ForEach(menuItems) { menuItem in
                Section(header: Text(menuItem.name)) {
                    OutlineGroup(menuItem.children ?? [MenuModel](),
                                 children: \.children) { child in
                        Label(child.name, systemImage: child.icon)
                    }
                }
            }
        }
        .listStyle(SidebarListStyle())
    }
}

// MARK: - PREVIEW
struct OutlineGroups_Previews: PreviewProvider {
    static var previews: some View {
        OutlineGroups()
    }
}
