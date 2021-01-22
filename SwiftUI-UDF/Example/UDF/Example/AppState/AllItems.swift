//
//  AllItems.swift
//  UDF
//
//  Created by Max Kuznetsov on 05.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import Foundation
import SwiftUI_UDF
import OrderedDictionary

struct AllItems: Reducible {
    var byId: OrderedDictionary<Item.Id, Item> = []
    
    mutating func reduce(_ action: AnyAction) {
        switch action.value {
        case let action as AnyAction.DidLoadItems<Item>:
            for item in action.items {
                byId[item.id] = item
            }
            
            byId.sort { $0.key.value < $1.key.value }
            
        default:
            break
        }
    }
}
