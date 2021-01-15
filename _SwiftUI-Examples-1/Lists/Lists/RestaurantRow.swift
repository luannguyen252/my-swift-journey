//
//  RestaurantRow.swift
//  Lists
//
//  Created by kim sunchul on 2020/05/22.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct RestaurantRow: View {
//    static items
    var name: String
//    dynamic items
    var restaurant:Restaurant
    
    var body: some View {
//        Text("Restaurant: \(name)")
        Text("Come and eat at  \(restaurant.name)")
    }
}

struct RestaurantRow_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantRow(name: "TEST", restaurant: Restaurant(name: "TEST2"))
    }
}
