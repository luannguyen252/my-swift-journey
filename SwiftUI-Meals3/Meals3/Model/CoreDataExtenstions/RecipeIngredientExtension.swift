//
//  RecipeIngredientExtension.swift
//  meals
//
//  Created by Uwe Petersen on 13.06.15.
//  Copyright (c) 2015 Uwe Petersen. All rights reserved.
//

import Foundation
import CoreData

extension RecipeIngredient {

    /// Return the Content of the nutrient with the key key as double
    func doubleForKey(_ key: String) -> Double? {
        if let foodValue = (food?.value(forKey: key) as? NSNumber)?.doubleValue {
            return foodValue * (amount?.doubleValue)! / 100 // per 100 g
        }
        return nil
    }
}


extension RecipeIngredient: Ingredient, Identifiable {

}
