//
//  DessertViewModel.swift
//  Chapter08
//
//  Created by Jayant Varma on 19/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import Foundation


struct DessertViewModel: Codable, Identifiable {
    let id = UUID()
    var name: String
    var image: String
    var ratings: Int
}


extension DessertViewModel {
    static var icecream: DessertViewModel {
        DessertViewModel(name: "Ice Cream", image: "TurtlePumpkinIcecream", ratings: 3)
    }
}
