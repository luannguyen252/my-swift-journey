//
//  Nutrients.swift
//  meals
//
//  Created by Uwe Petersen on 12.06.15.
//  Copyright (c) 2015 Uwe Petersen. All rights reserved.
//

import Foundation
import CoreData
import Combine

// Some notes:
//   @objc needed for
//      a) optional requirements (i.e. a property that may be implemented but not needs to be implemented) and
//      b) the ability to check for type conformity via "is", but
//      c) then the protocol can be adopted by classes only

/// Data type that provides the nutrients and their respecive amount contained
/// in a food, meal or recipe. Amount means relative amount (per 100 grams) for food
/// and absolute amount in the meal or recipe for meals an recipes.
protocol HasNutrients {
    
    var dateOfCreation: Date? { get }
    var amount: NSNumber? { get }

    /// returns the double value for the nutrient with the key key as stored.
    /// Since all nutrients have a unit property this is with respect to this unit.
    func doubleForKey(_ key: String) -> Double?
}



protocol Ingredient {
    var food: Food? {get set}
    var amount: NSNumber? {get set}
}

protocol IngredientCollection: NSManagedObject {
    var comment: String? {get set}
    var dateOfCreation: Date?  {get set}
    var dateOfLastModification: Date?  {get set}
    var ingredients: NSSet?  {get set}
    // Since a protocol cannot state conformance to ObservableObject (Error ist "Protocol 'NutrientCollection' can only be used as a generic constraint because it has Self or associated type requirements", but meal and recipe already conform to ObservableObject, I have added the property 'objectWillChange'. Thus one can publish when a change of the NutrientCollection (aka Meal or Recipe) occured and achieve similar behavior.
//    var objectWillChange: ObservableObjectPublisher { get } // Needed to iniate update to view with fetched meals.

    func addIngredient(food: Food, amount: NSNumber, managedObjectContext: NSManagedObjectContext)
}
