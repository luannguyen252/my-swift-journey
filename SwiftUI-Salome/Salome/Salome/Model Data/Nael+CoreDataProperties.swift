//
//  Nael+CoreDataProperties.swift
//  Salome
//
//  Created by App Designer2 on 15.08.20.
//
//

import Foundation
import CoreData


extension Nael {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Nael> {
        return NSFetchRequest<Nael>(entityName: "Nael")
    }

    @NSManaged public var name: String?
    @NSManaged public var biografie: String?
    @NSManaged public var date: Date?
    @NSManaged public var photo: Data?
    @NSManaged public var profile: Data?
    @NSManaged public var picCollection: Data?
    @NSManaged public var rating: Int64
    @NSManaged public var url: String?
    @NSManaged public var comment: String?

}
