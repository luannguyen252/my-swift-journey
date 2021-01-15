//
//  Big+CoreDataProperties.swift
//  Bigger
//
//  Created by App-Designer2 . on 21.11.19.
//  Copyright © 2019 App-Designer2 . All rights reserved.
//
//

import Foundation
import CoreData


extension Big {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Big> {
        return NSFetchRequest<Big>(entityName: "Big")
    }

    @NSManaged public var name: String?
    @NSManaged public var carier: String?
    @NSManaged public var saved: Bool

}
