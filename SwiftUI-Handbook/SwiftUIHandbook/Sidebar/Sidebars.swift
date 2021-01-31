//
//  Sidebars.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct Sidebars: View {
    // MARK: - BODY
    var body: some View {
        List(1..<11) { i in
            Text("Row \(i)")
        }
        .listStyle(SidebarListStyle())
    }
}

// MARK: - PREVIEW
struct Sidebars_Previews: PreviewProvider {
    static var previews: some View {
        Sidebars()
    }
}
