//
//  Recipe.swift
//  Meals3
//
//  Created by Uwe Petersen on 05.01.20.
//  Copyright © 2020 Uwe Petersen. All rights reserved.
//

import Foundation
import CoreData

extension Recipe {
    
    func filteredAndSortedIngredients(predicate: NSPredicate? = nil) -> [RecipeIngredient]? {
        if let ingredients = ingredients {
            // Recipe has ingredients.
            var filteredAndSortedIngredients = ingredients
            // Filter if a predicate is given (text in searchbar), which needs NSSet.
            if let predicate = predicate {
                filteredAndSortedIngredients = ingredients.filtered(using: predicate) as NSSet
            }
            // Sort thereafter and store in view model
            let sortDescriptor = NSSortDescriptor(key: "food.name", ascending: true)
            if let filteredAndSortedIngredients = filteredAndSortedIngredients.sortedArray(using: [sortDescriptor]) as? [RecipeIngredient] {
                return filteredAndSortedIngredients
            }
        } else {
            return nil // Recipe is empty (i.e. has no ingredients).
        }
        return nil
    }

}

extension Recipe: Identifiable {
    
}
