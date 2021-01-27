//
//  Item.swift
//  MyFirstTVOSApp
//
//  Created by Luan Nguyen on 12/12/2020.
//

import SwiftUI

// MARK: - ITEM DATA MODELS
struct Item: Identifiable {
    var id = UUID()
    var title: String
    var image: String
}

// MARK: - ITEM DATAS
var ItemData = [
    Item(title: "Movie 1", image: ""),
    Item(title: "Movie 2", image: ""),
    Item(title: "Movie 3", image: ""),
    Item(title: "Movie 4", image: ""),
    Item(title: "Movie 5", image: ""),
    Item(title: "Movie 6", image: ""),
    Item(title: "Movie 7", image: ""),
    Item(title: "Movie 8", image: ""),
    Item(title: "Movie 9", image: ""),
    Item(title: "Movie 10", image: ""),
    Item(title: "Movie 11", image: ""),
    Item(title: "Movie 12", image: ""),
    Item(title: "Movie 13", image: ""),
    Item(title: "Movie 14", image: ""),
    Item(title: "Movie 15", image: ""),
    Item(title: "Movie 16", image: ""),
    Item(title: "Movie 17", image: ""),
    Item(title: "Movie 18", image: ""),
    Item(title: "Movie 19", image: ""),
    Item(title: "Movie 20", image: ""),
]
