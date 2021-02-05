//
//  CurrentMeal.swift
//  Meals3
//
//  Created by Uwe Petersen on 02.01.20.
//  Copyright © 2020 Uwe Petersen. All rights reserved.
//

import Foundation

/// Holds the (current) meal, to which a food will be added.
///
/// Convention: Each view that has the possiibility to call `GeneralSearch` or `FoodDetail` (both of which can be used to add foods as ingredients to the current meal or reciple) has to set the current meal accordingly. This should be done in `.onAppear()`. Further more, if a meal is deleted or a meal is created, the current meal has to be updated. Generally, if a meal is not selected directle, the current meal is the newest meal available.

class CurrentMeal: ObservableObject {
    @Published var meal: Meal {
        willSet {
//            debugPrint("Will set current Meal to \(newValue.description)")
        }
    }
    init(_ meal: Meal) {
        self.meal = meal
    }
}
