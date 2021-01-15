//
//  HouseRow.swift
//  Game-of-Thrones-SwiftUI
//
//  Created by Christian Elies on 26.07.20.
//  Copyright © 2020 Christian Elies. All rights reserved.
//

import SwiftUI

struct HouseRow: View {
    let model: HouseMetadataModel

    var body: some View {
        #if os(macOS)
        Label(model.name, systemImage: "house").tag(model)
        #else
        NavigationLink(destination: HouseDetailScreen(url: model.url)) {
            Label(model.name, systemImage: "house")
        }
        #endif
    }
}

#if DEBUG
struct HouseRow_Previews: PreviewProvider {
    static var previews: some View {
        HouseRow(model: .init(url: URL(string: "https://duckduckgo.com")!, name: "Mock"))
    }
}
#endif
