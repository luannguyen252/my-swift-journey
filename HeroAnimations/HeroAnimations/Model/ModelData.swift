//
//  ModelData.swift
//  HeroAnimations
//
//  Created by Luan Nguyen on 13/12/2020.
//

import SwiftUI

// MARK: - BAG MODAL DATA
struct BagModel: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var price: String
}

// MARK: - BAG DATA
var bags = [
    BagModel(image: "bag1", title: "Women Bag 1", price: "$99"),
    BagModel(image: "bag2", title: "Women Bag 2", price: "$199"),
    BagModel(image: "bag3", title: "Women Bag 3", price: "$299"),
    BagModel(image: "bag4", title: "Women Bag 4", price: "$399"),
    BagModel(image: "bag5", title: "Women Bag 5", price: "$499"),
    BagModel(image: "bag6", title: "Women Bag 6", price: "$599"),
    BagModel(image: "bag7", title: "Women Bag 7", price: "$699"),
    BagModel(image: "bag8", title: "Women Bag 8", price: "$799"),
    BagModel(image: "bag9", title: "Women Bag 9", price: "$899"),
    BagModel(image: "bag10", title: "Women Bag 10", price: "$999"),
]

// MARK: - CATEGORY DATA
var scrollTabs = [
    "Hand Bag",
    "Jewellery",
    "Footwear",
    "Dresses",
    "Beauty"
]
