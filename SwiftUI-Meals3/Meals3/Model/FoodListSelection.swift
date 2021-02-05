//
//  FoodListSelection.swift
//  Meals3
//
//  Created by Uwe Petersen on 04.01.20.
//  Copyright © 2020 Uwe Petersen. All rights reserved.
//

import Foundation

enum FoodListSelection: String {
    case Favorites = "Favoriten"
    case Recipes = "Rezepte"
    case LastWeek = "Letzte Woche"
    case MealIngredients = "Gegessene"
    case OwnEntries = "Eingetragene"
    case BLS = "Bundeslebensmittelschlüssel"
    case All = "Alle"
    
    // TODO: correct source completely: opulate user's own entries with a spcific source and use BLS-Source in the following for the following switch statement
    var predicate: NSPredicate? {
        switch self {
        case .All:
            return nil
        case .Favorites:
            return NSPredicate(format: "favoriteListItem != nil")
        case .Recipes:
            return NSPredicate(format: "recipe != nil")
        case .LastWeek:
            let lastWeek = Date(timeIntervalSinceNow: -86400.0*7.0)
            return NSPredicate(format: "SUBQUERY(mealIngredients, $x, $x.meal.dateOfCreation >= %@).@count != 0", lastWeek as CVarArg)
        case .OwnEntries:
            return NSPredicate(format: "source = nil")
        case .MealIngredients:
            return NSPredicate(format: "mealIngredients.@count > 0")
        case .BLS:
            return NSPredicate(format: "source != nil")
        }
    }
    
}
