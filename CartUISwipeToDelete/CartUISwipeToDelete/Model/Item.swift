//
//  Item.swift
//  CartUISwipeToDelete
//
//  Created by Luan Nguyen on 13/12/2020.
//

import SwiftUI

struct Item: Identifiable{
    var id = UUID().uuidString
    var name : String
    var details : String
    var image : String
    var price : Float
    var quantity : Int
    var offset : CGFloat
    var isSwiped : Bool
}
