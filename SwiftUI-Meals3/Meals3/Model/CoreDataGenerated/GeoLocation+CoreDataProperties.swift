//
//  GeoLocation+CoreDataProperties.swift
//  Meals3
//
//  Created by Uwe Petersen on 31.10.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//
//

import Foundation
import CoreData


extension GeoLocation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GeoLocation> {
        return NSFetchRequest<GeoLocation>(entityName: "GeoLocation")
    }

    @NSManaged public var latitude: NSNumber?
    @NSManaged public var longitude: NSNumber?

}
