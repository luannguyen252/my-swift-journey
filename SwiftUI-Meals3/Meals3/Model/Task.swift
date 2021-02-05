//
//  Task.swift
//  Meals3
//
//  Created by Uwe Petersen on 02.01.20.
//  Copyright © 2020 Uwe Petersen. All rights reserved.
//

import Foundation

/// Handle whether a certain amount of food is to be added to an IngredientCollection (aka meal or recipe) or an the amount of an ingredient (of an IngredientCollection) is to be changed
enum Task {
    case addAmountOfFoodToIngredientCollection(IngredientCollection)
    case changeAmountOfIngredient(Ingredient)
}
