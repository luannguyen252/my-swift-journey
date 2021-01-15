//
//  DetailView.swift
//  Game-of-Thrones-SwiftUI
//
//  Created by Christian Elies on 26.07.20.
//  Copyright © 2020 Christian Elies. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @Binding var navigationItem: NavigationItem?
    @Binding var selectedHouse: HouseMetadataModel?

    var body: some View {
        switch navigationItem {
        case .houses:
            if let selectedHouse = selectedHouse {
                HouseDetailScreen(url: selectedHouse.url)
                    .frame(minWidth: 400, minHeight: 700)
            }
        case .characters:
            EmptyView()
        case .books:
            EmptyView()
        case .none:
            EmptyView()
        }
    }
}

#if DEBUG
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(navigationItem: .constant(nil), selectedHouse: .constant(nil))
    }
}
#endif
