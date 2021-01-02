//
//  Helper.swift
//  FoodDeliveryPart2
//
//  Created by Luan Nguyen on 02/01/2021.
//

import SwiftUI

// MARK: - CATEGORY ITEMS
enum Categories {
    case burger
    case pasta
    case pizza
    case desserts
}

// MARK: - FILTER DATA
func filterData(foodDataSet: [Food], by category: Categories) -> [Food] {
    var filteredArray = [Food]()
    
    for food in foodDataSet {
        if food.category == category {
            filteredArray.append(food)
        }
    }
    
    return filteredArray
}

// MARK: - CATEGORY TITLE
func categoryString (for category: Categories) -> String {
    switch category {
    case .pizza:
        return "Pizza"
    case .burger:
        return "Burger"
    case .pasta:
        return "Pasta"
    case .desserts:
        return "Desserts"
    }
}

