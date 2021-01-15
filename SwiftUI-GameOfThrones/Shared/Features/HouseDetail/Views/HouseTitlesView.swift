//
//  HouseTitlesView.swift
//  Game-of-Thrones-SwiftUI
//
//  Created by Christian Elies on 03.08.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import SwiftUI

struct HouseTitlesView: View {
    let titles: [String]

    var body: some View {
        ForEach(titles, id: \.self) { title in
            Text(title)
        }
    }
}

#if DEBUG
struct HouseTitlesView_Previews: PreviewProvider {
    static var previews: some View {
        HouseTitlesView(titles: [])
    }
}
#endif
