//
//  MealIngredient+CoreDataProperties.swift
//  Meals3
//
//  Created by Uwe Petersen on 31.10.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//
//

import Foundation
import CoreData


extension MealIngredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MealIngredient> {
        return NSFetchRequest<MealIngredient>(entityName: "MealIngredient")
    }

    @NSManaged public var amount: NSNumber?
    @NSManaged public var food: Food?
    @NSManaged public var meal: Meal?

}
