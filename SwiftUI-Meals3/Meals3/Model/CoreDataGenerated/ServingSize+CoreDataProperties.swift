//
//  ServingSize+CoreDataProperties.swift
//  Meals3
//
//  Created by Uwe Petersen on 31.10.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//
//

import Foundation
import CoreData


extension ServingSize {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ServingSize> {
        return NSFetchRequest<ServingSize>(entityName: "ServingSize")
    }

    @NSManaged public var amount: NSNumber?
    @NSManaged public var label: String?
    @NSManaged public var food: Food?

}
