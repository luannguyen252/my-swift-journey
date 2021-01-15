//
//  HouseSeatsView.swift
//  Game-of-Thrones-SwiftUI
//
//  Created by Christian Elies on 03.08.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import SwiftUI

struct HouseSeatsView: View {
    let seats: [String]

    var body: some View {
        ForEach(seats, id: \.self) { seat in
            Text(seat)
        }
    }
}

#if DEBUG
struct HouseSeatsView_Previews: PreviewProvider {
    static var previews: some View {
        HouseSeatsView(seats: [])
    }
}
#endif
