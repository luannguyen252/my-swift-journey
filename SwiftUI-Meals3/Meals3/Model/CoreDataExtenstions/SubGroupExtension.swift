//
//  SubGroupExtension.swift
//  meals
//
//  Created by Uwe Petersen on 01.02.15.
//  Copyright (c) 2015 Uwe Petersen. All rights reserved.
//

import Foundation
import CoreData

extension SubGroup {
    
    /// Fetches the subGroup from coredata database with the given BLS key (first and second position of the BLS string).
    /// E.g. the subGroup with name "Vollkornbrot" (which has the key "B1") will be returned for the food with 
    /// key "B105100" where the first two characters denote the subGroup and are "B1".
    class func fetchSubGroupForBLSSubGroupKey(_ key: String, inManagedObjectContext context: NSManagedObjectContext) -> SubGroup? {
        
        // 1st and second position in the bls-key string
        // returns the subGroup matching the subGroup character in the bls-key-string for the current food. E.g. the subGroup with name "Vollkornbrot" (which has the key "B1") will be returned for the food with key "B105100" where the first two characters denote the subGroup and are "B1"
        let request: NSFetchRequest<SubGroup> = SubGroup.fetchRequest()
        request.predicate = NSPredicate(format: "key = %@", argumentArray: [key])
        
        do {
            let subGroups = try context.fetch(request)
            assert(subGroups.count <= 1, "Error fetching subGroup from csv-File for key '\(key)':\n There is more than one subGroup returned for this food. SubGroup are: \(subGroups)")
            return subGroups.first
        } catch {
            print("Error fetching subGroup from csv-file for key '\(key)': Corresponding group not found.'")
        }
        return nil
    }
    
    class func fetchAllSubGroups(managedObjectContext context: NSManagedObjectContext) -> [SubGroup]? {
        let request: NSFetchRequest<SubGroup> = SubGroup.fetchRequest()
        
        do {
            let subGroups = try context.fetch(request)
            return subGroups
        } catch {
            print("Error fetching all subGroups: No SubGroups fetched or found.'")
        }
        return nil
    }
}

extension SubGroup: Identifiable {
    
}
