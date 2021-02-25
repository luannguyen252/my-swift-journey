//
//  Item.swift
//  Furnitures
//
//  Created by Balaji on 25/11/20.
//

import SwiftUI

// Model And Model Data...

struct Item: Identifiable{
    
    var id = UUID().uuidString
    var title: String
    var price: String
    var subTitle: String
    var image: String
    var offset : CGFloat = 0
}

