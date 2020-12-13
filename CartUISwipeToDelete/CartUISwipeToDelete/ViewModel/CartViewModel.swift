//
//  CartViewModel.swift
//  CartUISwipeToDelete
//
//  Created by Luan Nguyen on 13/12/2020.
//

import SwiftUI

class CartViewModel: ObservableObject {
    // MARK: - CART ITEMS
    @Published var items = [
        Item(name: "Blazer Model 1", details: "Gray - L", image: "p1", price: 49.9, quantity: 1,
             offset: 0, isSwiped: false),
        Item(name: "Blazer Model 2", details: "Gray - M", image: "p2", price: 59.9, quantity: 2, offset: 0, isSwiped: false),
        Item(name: "Blazer Model 3", details: "Gray - L", image: "p3", price: 40.9, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Blazer Model 4", details: "Blue - L", image: "p4", price: 49.9, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Blazer Model 5", details: "Dark Blue - M", image: "p5", price: 59.9, quantity: 1, offset: 0, isSwiped: false),
    ]
}
