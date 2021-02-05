//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Sandesh on 15/11/20.
//  Copyright © 2020 devsandesh. All rights reserved.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    var wrappedName: String {
        name ?? "Unknown"
    }
}

extension Candy : Identifiable {

}
