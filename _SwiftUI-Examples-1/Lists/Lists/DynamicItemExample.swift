//
//  DynamicItemExample.swift
//  Lists
//
//  Created by kim sunchul on 2020/05/22.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct DynamicItemExample: View {
    var body: some View {
        let first = Restaurant(name: "Joe's Original")
        let second = Restaurant(name: "The Real Joe's Original")
        let third = Restaurant(name: "Original Joe's")
        let restaurants = [first, second, third]

        return List(restaurants) { restaurant in
            RestaurantRow(name: "", restaurant: restaurant)
        }
    }
}

struct DynamicItemExample_Previews: PreviewProvider {
    static var previews: some View {
        DynamicItemExample()
    }
}
