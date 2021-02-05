//
//  SearchFilter.swift
//  meals2
//
//  Created by Uwe Petersen on 14.10.17.
//  Copyright © 2017 Uwe Petersen. All rights reserved.
//

import Foundation

/// Search filter for searches in database
///
/// - BeginsWith: Searches for foods/ingredients whose name begin with the search text, e.g. "Ei" will list "Eier" but not "Speiseeis"
/// - Contains: Searchs for foods/ingredients whose name contains the search text, e.g. "Ei" will list both, "Eier" and "Speiseis".
enum SearchFilter: String {
    case BeginsWith = "Name beginnt mit ..."
    case Contains = "Name enthält ..."
    
    //    return NSPredicate(format: "name BEGINSWITH[c] %@", searchText)
    /// returns predicate for search text and corresponding selected scope bar item.
    ///
    /// - Parameter searchText: the search text of the search bar
    /// - Returns: a predicate for the fetch request 
    func predicateForSearchText(_ searchText: String?) -> NSPredicate? {
        guard let searchText = searchText, !searchText.isEmpty else {
            return nil
        }
        switch self {
        case .BeginsWith:
            // Search foods where the name begins with the exact term given in the search bar text field
            return NSPredicate(format: "name BEGINSWITH[c] %@", searchText)
        case .Contains:
            // Search for foods where the name contains the words given in the search bar text field
            let words = searchText.split(separator: " ")
            print("The words in the search text: \(words)")
            
            // Loop over the components, build predicate for each one (word), functional way of creating an arry of predicates
            let subPredicates = words.map({word -> NSPredicate in NSPredicate(format: "name contains[c] %@", word as CVarArg)})
            
            return NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: subPredicates)
        }
    }
    
    func predicateForMealOrRecipeIngredientsWithSearchText(_ searchText: String?) -> NSPredicate? {
        guard let searchText = searchText, !searchText.isEmpty else {
            return nil
        }
        switch self {
        case .BeginsWith:
            // Search foods where the name begins with the exact term given in the search bar text field
            return NSPredicate(format: "food.name BEGINSWITH[c] %@", searchText)
        case .Contains:
            // Search for foods where the name contains the words given in the search bar text field
            let words = searchText.split(separator: " ")
            print("The words in the search text: \(words)")
            
            // Loop over the components, build predicate for each one (word), functional way of creating an arry of predicates
            let subPredicates = words.map({word -> NSPredicate in NSPredicate(format: "food.name contains[c] %@", word as CVarArg)})
            
            return NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: subPredicates)
        }
    }
    
    
    /// Predicate for alphabetical search on meals.
    ///
    /// Returns the predicate to do an alphabetical text search on meals that have ingredients whose food names satisfiy the search text filter.
    /// Example predicate: NSPredicate(format: "SUBQUERY(ingredients, $x, ANY $x.food.name CONTAINS[c] %@).@count != 0", word)
    ///
    /// - Parameter searchText: the search text
    /// - Returns: predicate for filtering data using a fetched results controller on Meal entity.
    func predicateForMealsWithIngredientsWithSearchText(_ searchText: String?) -> NSPredicate? {
        guard let searchText = searchText, !searchText.isEmpty else {
            return nil
        }
        switch self {
        case .BeginsWith:
            // Search foods where the name begins with the exact term given in the search bar text field
            return NSPredicate(format: "SUBQUERY(ingredients, $x, $x.food.name BEGINSWITH[c] %@).@count != 0", searchText as CVarArg)
        case .Contains:
            // Search for foods where the name contains the words given in the search bar text field
            // see https://stackoverflow.com/questions/18051948/core-data-subquery-predicate
            let words = searchText.split(separator: " ")
            guard words.count >= 1 else {
                return nil
            }
            var predicateString = "SUBQUERY(ingredients, $x, $x.food.name CONTAINS[c] \"" + words.first! + "\" "
            predicateString += words.dropFirst().reduce("", {$0 + " AND $x.food.name CONTAINS[c] \"" + $1 + "\""})
            predicateString += ").@count != 0"
            
            return NSPredicate(format: predicateString, argumentArray: nil)
        }
    }

    /// Predicate for alphabetical search on meal ingredients.
    ///
    /// Returns the predicate to do an alphabetical text search on meal ingredients whose food names satisfiy the search text filter.
    /// Example predicate: NSPredicate(format: "food.name CONTAINS[c] %@", word).
    ///
    /// - Parameter searchText: the search text
    /// - Returns: predicate for filtering data of an NSSet of mealIngredients
    func shortPredicateForMealsWithIngredientsWithSearchText(_ searchText: String?) -> NSPredicate? {
        guard let searchText = searchText, !searchText.isEmpty else {
            return nil
        }
        switch self {
        case .BeginsWith:
            // Search foods where the name begins with the exact term given in the search bar text field
            return NSPredicate(format: "food.name BEGINSWITH[c] %@", searchText as CVarArg)
        case .Contains:
            // Search for foods where the name contains the words given in the search bar text field
            let words = searchText.split(separator: " ")
            print("The words in the search text: \(words)")
            
            // Loop over the components, build predicate for each one (word), functional way of creating an arry of predicates
            let subPredicates = words.map({word -> NSPredicate in NSPredicate(format: "food.name CONTAINS[c] %@", word as CVarArg)})
            
            return NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: subPredicates)
        }
    }
    
}
