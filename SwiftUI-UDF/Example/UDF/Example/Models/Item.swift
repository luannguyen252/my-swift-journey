//
//  Item.swift
//  UDF
//
//  Created by Max Kuznetsov on 05.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import Foundation

struct Item {
    struct Id: Hashable {
        var value: Int
    }
    
    var id: Id
    var value = Int.random(in: 0...100)
    var isFavorite: Bool = false
}

extension Item: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
