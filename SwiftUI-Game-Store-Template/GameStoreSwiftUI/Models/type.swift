//
//  type.swift
//  GameStoreSwiftUI
//
//  Created by Tarokh on 10/10/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation

struct type: Identifiable {
    
    // define some variables
    var id: Int
    var name: String
    var price: String
    var image: String
    
}

var scorlllist = ["Games","Apps","Preorders","App Purchases"]

var toplist = ["s2","s1","s3"]

var infos = ["info1","info2","info3"]

var options = ["Information","Reviews"]

var bottomlist = [type(id: 0, name: "Tiny Guardians", price: "$29.99",image: "h1"),
type(id: 1, name: "Kingdom Rush", price: "$15.99",image: "h2"),
type(id: 2, name: "Dragon Heroes", price: "$9.99",image: "h3"),
type(id: 3, name: "War Of Crown", price: "$19.99",image: "h4")]
