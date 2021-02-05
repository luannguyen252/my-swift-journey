//
//  TestFlowers.swift
//  FlowerPower
//
//  Created by Daniel Bolella on 7/12/19.
//  Copyright © 2019 Daniel Bolella. All rights reserved.
//

import SwiftUI

struct Flower : Identifiable {
    var id = UUID()
    var name : String
    var actualClass : String
    var imageName : String { return name }
}

let testFlowerData = [
    Flower(name: "test", actualClass: "daisy"),
    Flower(name: "testD", actualClass: "dandelion"),
    Flower(name: "testR", actualClass: "rose"),
    Flower(name: "testS", actualClass: "sunflower"),
    Flower(name: "testT", actualClass: "tulip")
]
