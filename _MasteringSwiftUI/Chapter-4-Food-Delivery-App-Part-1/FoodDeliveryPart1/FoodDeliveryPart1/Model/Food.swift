//
//  Food.swift
//  FoodDeliveryPart1
//
//  Created by Luan Nguyen on 02/01/2021.
//

import SwiftUI

struct Food: Identifiable {
    let id = UUID()
    let title: String
    let price: Double
    let category: Categories
}
