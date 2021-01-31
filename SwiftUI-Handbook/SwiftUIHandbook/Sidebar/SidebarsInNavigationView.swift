//
//  SidebarsInNavigationView.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct SidebarsInNavigationView: View {
    // MARK: - BODY
    var body: some View {
        NavigationView {
            SidebarView()
            List(0 ..< 20) {_ in
                Text("Book")
            }
            .navigationTitle("Book List")
        }
    }
}

// MARK: - PREVIEW
struct SidebarsInNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarsInNavigationView()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
    }
}
