//
//  Helper.swift
//  MasteringTableViewsLists
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

// We call the enum Categories and insert four different cases for our four categories.
enum Categories {
    case burger
    case pasta
    case pizza
    case dessert
}

// To filter the data of the foodData array by the selected category
func filterData(by category: Categories) -> [Food] {
    var filteredArray = [Food]()
    
    for food in foodData {
        if food.category == category {
            filteredArray.append(food)
        }
    }
    
    return filteredArray
}

// we need to write a function that returns a appropriate string to us depending on the currentCategory.
func categoryString (for category: Categories) -> String {
    switch category {
    case .pizza:
        return "Pizza"
    case .burger:
        return "Burger"
    case .pasta:
        return "Pasta"
    case .dessert:
        return "Desserts"
    }
}
