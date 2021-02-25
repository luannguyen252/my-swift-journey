//
//  Item.swift
//  Kids
//
//  Created by Balaji on 28/09/20.
//

import SwiftUI

struct Item : Identifiable {
    var id = UUID().uuidString
    var image : String
    var title : String
    var price : String
    var color : Color
    var detail: String
}

var items : [Item] = [

    Item(image: "sweet", title: "Sweet soda", price: "8$", color: Color("Color"), detail: ""),
    Item(image: "colessumdonut", title: "Colosseum donut", price: "14$", color: Color("Color1"), detail: ""),
    Item(image: "seriouslama", title: "Serous lama", price: "36$", color: Color("Color2"), detail: ""),
    Item(image: "nyasaicecream", title: "Nyasha ice cream", price: "19$", color: Color("Color3"), detail: ""),
]
