//
//  HouseAncestralWeaponsView.swift
//  Game-of-Thrones-SwiftUI
//
//  Created by Christian Elies on 03.08.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import SwiftUI

struct HouseAncestralWeaponsView: View {
    let ancestralWeapons: [String]

    var body: some View {
        ForEach(ancestralWeapons, id: \.self) { ancestralWeapon in
            Text(ancestralWeapon)
        }
    }
}

#if DEBUG
struct HouseAncestralWeaponsView_Previews: PreviewProvider {
    static var previews: some View {
        HouseAncestralWeaponsView(ancestralWeapons: [])
    }
}
#endif
