//
//  DessertViewModel.swift
//  Chapter11
//
//  Created by Jayant Varma on 21/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import Foundation

struct DessertViewModel {
    let id = UUID()
    var name: String
    var image: String
    var ratings: Int
}

extension DessertViewModel {
    static let icecream = DessertViewModel(name: "Ice Cream", image: "icecream", ratings: 3)
}
