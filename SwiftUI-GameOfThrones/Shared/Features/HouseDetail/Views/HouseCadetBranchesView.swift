//
//  HouseCadetBranchesView.swift
//  Game-of-Thrones-SwiftUI
//
//  Created by Christian Elies on 03.08.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import SwiftUI

struct HouseCadetBranchesView: View {
    let cadetBranches: [URL]
    
    var body: some View {
        ForEach(cadetBranches, id: \.self) { cadetBranch in
            Link(destination: cadetBranch) {
                Text(cadetBranch.absoluteString)
            }
        }
    }
}

#if DEBUG
struct HouseCadetBranchesView_Previews: PreviewProvider {
    static var previews: some View {
        HouseCadetBranchesView(cadetBranches: [])
    }
}
#endif
