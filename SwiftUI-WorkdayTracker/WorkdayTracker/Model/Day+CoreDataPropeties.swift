//
//  Day+CoreDataPropeties.swift
//  WorkdayTracker
//
//  Created by Oded Golden on 20/09/2020.
//

import CoreData
import SwiftUI

extension Day {
    @NSManaged var start: Date?
    @NSManaged var end: Date?
    @NSManaged var id: UUID?
    
    static func createWith(start: Date?, end: Date?, using context: NSManagedObjectContext) -> NSManagedObjectID{
        print("ok")
        let day = Day(context: context)
        day.start = start
        day.end = end
        day.id = UUID()
        
        do {
            try context.save()
            return day.objectID
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    static func basicFetchRequest() -> FetchRequest<Day> {
        FetchRequest(entity: Day.entity(), sortDescriptors: [])
    }
    
    static func sortedFetchRequest() -> FetchRequest<Day> {
        let dateSortDescriptor = NSSortDescriptor(key: "start", ascending: true)
        return FetchRequest(entity: Day.entity(), sortDescriptors: [dateSortDescriptor])
    }
}
