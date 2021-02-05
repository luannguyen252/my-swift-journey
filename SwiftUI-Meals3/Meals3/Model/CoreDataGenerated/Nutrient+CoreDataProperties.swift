//
//  Nutrient+CoreDataProperties.swift
//  Meals3
//
//  Created by Uwe Petersen on 31.10.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//
//

import Foundation
import CoreData


extension Nutrient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Nutrient> {
        return NSFetchRequest<Nutrient>(entityName: "Nutrient")
    }

    @NSManaged public var dispUnit: String?
    @NSManaged public var key: String?
    @NSManaged public var keyOriginalBLS: String?
    @NSManaged public var name: String?
    @NSManaged public var nameEnglish: String?
    @NSManaged public var type: String?
    @NSManaged public var typeEnglish: String?
    @NSManaged public var unit: String?

}
