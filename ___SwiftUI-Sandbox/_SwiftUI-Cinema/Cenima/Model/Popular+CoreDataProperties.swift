//
//  Popular+CoreDataProperties.swift
//  Cenima
//
//  Created by mohammad mugish on 21/02/21.
//
//

import Foundation
import CoreData


extension Popular {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Popular> {
        return NSFetchRequest<Popular>(entityName: "Popular")
    }

    @NSManaged public var popularMovie: [CustomObject]?
    @NSManaged public var timeStamp: Date?
}

extension Popular : Identifiable {

}
