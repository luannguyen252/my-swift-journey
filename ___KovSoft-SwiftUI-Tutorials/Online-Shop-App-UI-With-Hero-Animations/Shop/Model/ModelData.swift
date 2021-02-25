//
//  ModelData.swift
//  Shop
//
//  Created by Balaji on 05/10/20.
//

import SwiftUI


// Model Data...

struct BagModel: Identifiable {
    var id = UUID().uuidString
    var image : String
    var title: String
    var price: String
}

var bags = [

    BagModel(image: "bag1", title: "Office Bag", price: "$234"),
    BagModel(image: "bag5", title: "Stylus Bag", price: "$434"),
    BagModel(image: "bag6", title: "Round Belt", price: "$134"),
    BagModel(image: "bag2", title: "Belt Bag", price: "$294"),
    BagModel(image: "bag3", title: "Hang Top", price: "$204"),
    BagModel(image: "bag4", title: "Old Fashion", price: "$334")

]

// For Top SCrolling Tab Buttons....
var scroll_Tabs = ["Hand Bag","Jewellery","Footwear","Dresses","Beauty"]
