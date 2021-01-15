//
//  StaticItemExample.swift
//  Lists
//
//  Created by kim sunchul on 2020/05/22.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct StaticItemExample: View {
    var body: some View {
        List {
            RestaurantRow(name: "Joe's Original", restaurant: Restaurant(name: ""))
            RestaurantRow(name: "The Real Joe's Original", restaurant: Restaurant(name: ""))
            RestaurantRow(name: "Original Joe's", restaurant: Restaurant(name: ""))
        }
    }
}

struct StaticItemExample_Previews: PreviewProvider {
    static var previews: some View {
        StaticItemExample()
    }
}
