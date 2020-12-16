//
//  Food.swift
//  MasteringTableViewsLists
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

// MARK: - FOOD DATA MODEL
class Food: Identifiable {
    // MARK: - DATA MODEL
    let title: String
    let price: Double
    let category: Categories
    let id: Int
    
    // MARK: - SET INITIALIZER
    init(title: String, price: Double, category: Categories, id: Int) {
        self.title = title
        self.price = price
        self.category = category
        self.id = id
    }
}
