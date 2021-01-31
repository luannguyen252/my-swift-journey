//
//  Plant.swift
//  WaterMyPlants
//
//  Created by Toomas Vahter on 12.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import CoreData
import os

final class Plant: NSManagedObject, Identifiable {
    @NSManaged var id: String
    @NSManaged var name: String
    
    @NSManaged var lastWateringDate: Date
    @NSManaged var nextWateringDate: Date
}

extension Plant {
    static let entityName = "Plant"
    
    static func makeRequest() -> NSFetchRequest<Plant> {
        return NSFetchRequest<Plant>(entityName: entityName)
    }
    
    static func makeDictionaryRequest() -> NSFetchRequest<NSDictionary> {
        return NSFetchRequest<NSDictionary>(entityName: entityName)
    }
    
    static func insert(withName name: String, into context: NSManagedObjectContext) -> Plant {
        let plant = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as! Plant
        plant.id = UUID().uuidString
        plant.name = name
        return plant
    }
    
    static func allPlantsController(context: NSManagedObjectContext, sortDescriptors: [NSSortDescriptor] = []) -> NSFetchedResultsController<Plant> {
        let request = makeRequest()
        request.sortDescriptors = sortDescriptors.isEmpty ? nil : sortDescriptors
        return NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    static func all(in context: NSManagedObjectContext) -> [Plant] {
        let request = makeRequest()
        do {
            return try context.fetch(request)
        }
        catch let nsError as NSError {
            os_log(.debug, log: .plants, "failed fetching all plants with error %s %s", nsError, nsError.userInfo)
            return []
        }
    }
    
    static func allPlantsDictionaryRepresentation() -> [NSDictionary] {
        let request = makeDictionaryRequest()
        request.resultType = .dictionaryResultType
        do {
            return try request.execute()
        }
        catch let nsError as NSError {
            os_log(.debug, log: .plants, "failed fetching all plants with error %s %s", nsError, nsError.userInfo)
            return []
        }
    }
}
