//
//  Employee+CoreDataProperties.swift
//  Coredata-SwiftUI
//
//  Created by Keerthi on 26/08/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var age: String?
    @NSManaged public var gender: String?
    @NSManaged public var username: String?
    @NSManaged public var experience: String?

}
