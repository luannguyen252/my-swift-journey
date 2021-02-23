//
//  TopRated+CoreDataProperties.swift
//  Cenima
//
//  Created by mohammad mugish on 21/02/21.
//
//

import Foundation
import CoreData


extension TopRated {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TopRated> {
        return NSFetchRequest<TopRated>(entityName: "TopRated")
    }

    @NSManaged public var topRatedMovie: [CustomObject]?
    @NSManaged public var timeStamp: Date?
}

extension TopRated : Identifiable {

}
