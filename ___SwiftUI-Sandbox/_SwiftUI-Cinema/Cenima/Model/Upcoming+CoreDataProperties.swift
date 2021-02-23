//
//  Upcoming+CoreDataProperties.swift
//  Cenima
//
//  Created by mohammad mugish on 21/02/21.
//
//

import Foundation
import CoreData


extension Upcoming {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Upcoming> {
        return NSFetchRequest<Upcoming>(entityName: "Upcoming")
    }

    @NSManaged public var upcomingMovie: [CustomObject]?
    @NSManaged public var timeStamp: Date?
}

extension Upcoming : Identifiable {

}
