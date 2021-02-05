//
//  GroupExtension.swift
//  meals
//
//  Created by Uwe Petersen on 01.02.15.
//  Copyright (c) 2015 Uwe Petersen. All rights reserved.
//

import Foundation
//import LlamaKit
import CoreData

extension Meals3.Group {
    
    /// Fetches the group from coredata database with the given BLS key (first position of the BLS string). For instance:
    /// The group with name "Brot und Kleingebäck" (which has the key "B") will be returned for the food with key "B105100"
    /// where the first character denotes the group and is a "B".
    class func fetchGroupForBLSGroupKey(_ key: String, inManagedObjectContext context: NSManagedObjectContext) -> Group? {
        
        // 1st position in the bls-key string
        // returns the group matching the group character in the bls-key-string for the current food. E.g. the group with name "Brot und Kleingebäck" (which has the key "B") will be returned for the food with key "B105100" where the first character denotes the group and is a "B"
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Group")
        request.predicate = NSPredicate(format: "key = %@", argumentArray: [key])
        
        do {
            if let groups = try context.fetch(request) as? [Group] {
                assert(groups.count <= 1, "Error fetching group from csv-File for key '\(key)':\n There is more than one group returned for this food. Groups are: \(groups)")
                return groups.first
            }
        } catch {
            print("Error fetching group from csv-file for key '\(key)': Corresponding group not found.'")
        }
//        let error: NSError? = nil
//        if let groups = context.executeFetchRequest(request) as? [Group] {
//            
//            assert(groups.count <= 1, "Error fetching group from csv-File for key '\(key)':\n There is more than one group returned for this food. Groups are: \(groups)")
//            return groups.first
//            
//        } else if error != nil {
//            print("Error fetching group from csv-file for key '\(key)': Corresponding group not found.'")
//        }
        return nil
    }
    
    /// Fetches the group from coredata database with the given BLS key (first position of the BLS string). For instance:
    /// The group with name "Brot und Kleingebäck" (which has the key "B") will be returned for the food with key "B105100"
    /// where the first character denotes the group and is a "B".
    class func fetchGroupForBLSGroupKey(_ key: String, inManagedObjectContext context: NSManagedObjectContext) -> Result<Group?,NSError> {
        
        // 1st position in the bls-key string
        // returns the group matching the group character in the bls-key-string for the current food. E.g. the group with name "Brot und Kleingebäck" (which has the key "B") will be returned for the food with key "B105100" where the first character denotes the group and is a "B"
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Group")
        request.predicate = NSPredicate(format: "key = %@", argumentArray: [key])
        //        request.predicate = NSPredicate(format: "key = '\(key)'")
        
        do {
            if let groups = try context.fetch(request) as? [Meals3.Group] {
                assert(groups.count <= 1, "Error fetching group from csv-File for key '\(key)':\n There is more than one group returned for this food. Groups are: \(groups)")
                return success(groups.first)
            }
        } catch {
            print("Error fetching group from csv-file for key '\(key)': Corresponding group not found.'")
            return failure(error as NSError)
        }
        return success(nil)
    }
}

extension Meals3.Group: Identifiable {

}
