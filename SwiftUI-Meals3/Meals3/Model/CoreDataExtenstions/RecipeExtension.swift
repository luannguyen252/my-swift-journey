//
//  RecipeExtension.swift
//  meals
//
//  Created by Uwe Petersen on 12.06.15.
//  Copyright (c) 2015 Uwe Petersen. All rights reserved.
//

import Foundation
import CoreData


/// Dircets how the amount (weight) of a recipe will be determined, when its preparation is finished.
enum RecipeAmount {
    /// Amount (weight) will be calculated as the sum of the amounts (weights) of all its ingredients.
    case sumOfAmountsOfRecipeIngredients
    /// Amount (weight) will be taken from user input.
    ///
    /// This is for the case when there was a loss in weight during the preparation of the recipe, e.g. because of water vaporization when cooking or baking. The assumption is that water was lost during preparation.
    case asInputByUser(amount: Double?)
}

extension Recipe {

    public override func awakeFromInsert() {
        // Set date automatically when object ist created
        super.awakeFromInsert()
        dateOfCreation = Date() as NSDate as Date
        dateOfLastModification = Date() as NSDate as Date
    }
    
    /// Overall amount of all meal ingredients in gram
    var amountOfAllIngredients: Double {
        return ingredients?.allObjects
            .filter{$0 is RecipeIngredient}
            .map {$0 as! RecipeIngredient}
            .map {$0.amount!.doubleValue}   // Todo: Ensure that amount is never nil
            .reduce(0.0, +) ?? 0
    }
    
    class func fetchAllRecipes(managedObjectContext context: NSManagedObjectContext) -> [Recipe]? {

        let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        do {
            let recipes = try context.fetch(request)
            return recipes
        } catch {
            print("Error fetching recipes: \(error)")
        }
        return nil
    }
    
    
    /// sum of the content of one nutrient (e.g. "totalCarb") in a meal. Thus one has to sum over all (recipe) ingredients
    /// Example: (sum [totalCarb content of each ingredient] / 100)
    func doubleForKey(_ key: String) -> Double? {
        guard let ingredients = ingredients else {return nil}
        let quantities = ingredients.compactMap{$0 as? RecipeIngredient}  // convert NSSet to [AnyObject] (via .allObjects) and then to [MealIngredient]
            .filter {$0.food?.value(forKeyPath: key) is NSNumber}             // valueForKeyPath returns AnyObject, thus check if it is of type NSNumber, and use only these
            .map   {($0.food?.value(forKeyPath: key) as! NSNumber).doubleValue / 100.0 * ($0.amount?.doubleValue)!} // Convert to NSNumber and then Double and multiply with amount of this ingredient
        
        // sum up the values of all meal ingredients or return nil if no ingredients values where available (i.e. all foods had no entry for this nutrient)
        if quantities.isEmpty {
            return nil
        } else {
            return quantities.reduce(0.0, +)
        }
    }
    
    func doubleForNutrient(_ nutrient: Nutrient) -> Double? {
        return doubleForKey(nutrient.key!)
    }
    
    /// Creates a new meal by from the given meal.The new meal will have the same meal ingredients and that is it.
    /// Everything else will be as with a new meal. Since meal ingredients are unique to a meal, the have to be
    /// created newly from the ones of the given meal.
    class func fromMeal(_ meal: Meal, inManagedObjectContext context: NSManagedObjectContext) -> Recipe? {
        
        let recipe = Recipe(context: context)
        // copy meal ingredients (a meal ingredient can have only one meal, thus new meal ingredients have to be created)
        if let mealIngredients = meal.ingredients?.allObjects as? [MealIngredient] {
            for mealingredient in mealIngredients {
                let recipeIngredient = RecipeIngredient(context: context)
                recipeIngredient.food = mealingredient.food
                recipeIngredient.amount = mealingredient.amount
                recipeIngredient.recipe = recipe
            }
        }
        recipe.comment = meal.comment
        recipe.amount = NSNumber(value: recipe.amountOfAllIngredients as Double)
        recipe.food = Food.fromRecipe(recipe, inManagedObjectContext: context)
        
        return recipe
    }

}

extension Recipe: IngredientCollection {
    func addIngredient(food: Food, amount: NSNumber, managedObjectContext: NSManagedObjectContext) {

        let recipeIngredient = RecipeIngredient(context: managedObjectContext)
        recipeIngredient.food = food
        recipeIngredient.amount = amount
        addToIngredients(recipeIngredient)
        dateOfLastModification = Date()
        try? managedObjectContext.save()
        
//            // Save and sync to HealthKit
//             saveContextAndsyncToHealthKit(self)
    }
}


