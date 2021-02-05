//
//  PreparationExtension.swift
//  meals
//
//  Created by Uwe Petersen on 01.02.15.
//  Copyright (c) 2015 Uwe Petersen. All rights reserved.
//

import Foundation
import CoreData


extension Preparation {
    
    /// Fetches the preparation from coredata database with the given BLS key (sixth position
    /// of BLS string and group key must match a group in the long string groupsKeystring).
    class func fetchPreparationForBLSPreparationKey(_ key: String, andGroupKey groupKey: String, inManagedObjectContext context: NSManagedObjectContext) -> Preparation? {
        
        let request: NSFetchRequest<Preparation> = Preparation.fetchRequest()
        request.predicate = NSPredicate(format: "key = '\(key)' AND groupKeysString CONTAINS[c] '\(groupKey)'")

        do {
            let preparations = try context.fetch(request)
            assert(preparations.count <= 1, "Error fetching preparation from csv-File for key '\(key)' and subGroup key '\(groupKey)':\n There is more than one preparation returned for this food. Preparations are: \(preparations)")
            return preparations.first
        } catch {
            print("Error fetching preparation from csv-file for key '\(key)' and group key '\(groupKey)': Corresponding preparation not found.'")
            return nil
        }
    }
}
extension Preparation: Identifiable {
    
}
