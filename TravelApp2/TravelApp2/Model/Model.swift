//
//  Model.swift
//  TravelApp2
//
//  Created by Luan Nguyen on 23/12/2020.
//

import SwiftUI

// MARK: - DATA MODEL
struct Model: Identifiable {
    var id = UUID().uuidString
    var title: String
    var country: String
    var ratings: String
    var price: String
    var img: String
}

// MARK: - DATA
var data = [
    Model(title: "Carribean", country: "French", ratings: "4.9", price: "$200", img: "p1"),
    Model(title: "Big Sur", country: "USA", ratings: "4.1", price: "$150", img: "p2"),
]
