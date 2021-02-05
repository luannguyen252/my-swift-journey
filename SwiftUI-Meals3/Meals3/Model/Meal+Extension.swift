//
//  Meal+Extension.swift
//  Meals3
//
//  Created by Uwe Petersen on 02.11.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//

import SwiftUI
import CoreData

extension Meal {
    
    func filteredAndSortedMealIngredients(predicate: NSPredicate? = nil) -> [MealIngredient]? {
        if let mealIngredients = ingredients {
            // Meal has meal ingredients.
            var filteredAndSortedMealIngredients = mealIngredients
            // Filter if a predicate is given (text in searchbar), which needs NSSet.
            if let predicate = predicate {
                filteredAndSortedMealIngredients = mealIngredients.filtered(using: predicate) as NSSet
            }
            // Sort thereafter and store in view model
            let sortDescriptor = NSSortDescriptor(key: "food.name", ascending: true)
            if let filteredAndSortedMealIngredients = filteredAndSortedMealIngredients.sortedArray(using: [sortDescriptor]) as? [MealIngredient] {
                return filteredAndSortedMealIngredients
            }
        } else {
            return nil // Meal is empty (i.e. has no meal ingredients).
        }
        return nil
    }

}


extension Meal: Identifiable {
    public var id: Date {
        self.dateOfCreation ?? Date() // dateOfCreation should never be nil, but avoid forced unwrapping anyways.
    }
}
