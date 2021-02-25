//
//  Item.swift
//  Juice
//
//  Created by Balaji on 03/11/20.
//

import SwiftUI

struct Item: Identifiable {
    
    var id = UUID().uuidString
    var title: String
    var price: String
    var discount: String
    // both image and color name are same...
    var image: String
}


