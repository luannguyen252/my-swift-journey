//
//  Event+CoreDataProperties.swift
//  Meals3
//
//  Created by Uwe Petersen on 31.10.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var basalDosis: NSNumber?
    @NSManaged public var bloodSugar: NSNumber?
    @NSManaged public var bloodSugarGoal: NSNumber?
    @NSManaged public var carb: NSNumber?
    @NSManaged public var chu: NSNumber?
    @NSManaged public var chuBolus: NSNumber?
    @NSManaged public var chuFactor: NSNumber?
    @NSManaged public var comment: String?
    @NSManaged public var correctionBolus: NSNumber?
    @NSManaged public var correctionDivisor: NSNumber?
    @NSManaged public var dayString: String?
    @NSManaged public var energy: NSNumber?
    @NSManaged public var fat: NSNumber?
    @NSManaged public var fpu: NSNumber?
    @NSManaged public var fpuBolus: NSNumber?
    @NSManaged public var fpuFactor: NSNumber?
    @NSManaged public var protein: NSNumber?
    @NSManaged public var shortBolus: NSNumber?
    @NSManaged public var timestamp: Date?
    @NSManaged public var useBreadUnits: NSNumber?
    @NSManaged public var weight: NSNumber?

}
