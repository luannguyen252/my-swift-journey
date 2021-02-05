//
//  DetailExtentsion.swift
//  meals
//
//  Created by Uwe Petersen on 01.02.15.
//  Copyright (c) 2015 Uwe Petersen. All rights reserved.
//

import Foundation
import CoreData


extension Detail {
    
    class func fetchDetailForBLSGroupKey(_ key: String, andSubGroupKey subGroupKey: String, inManagedObjectContext context: NSManagedObjectContext) -> Detail? { // 5th position in the bls-key string
        
        // returns the food detail information matching the detail number and the group characters in the bls-key-string for the current food.
        let request: NSFetchRequest<Detail> = Detail.fetchRequest()
        request.predicate = NSPredicate(format: "key = '\(key)' AND subGroupKeysString CONTAINS[c] '\(subGroupKey)'")
        
        do {
            let details = try context.fetch(request)
            assert(details.count <= 1, "Error fetching Details from csv-File for key '\(key)' and subGroup key '\(subGroupKey)':\n There is more than one detail returned for this food. Details are: \(details)")
            return details.first
        } catch {
            print("Error fetching Details from csv-file for key '\(key)' and subGroup key '\(subGroupKey)': Corresponding detail not found.'")
            return nil
        }
    }
}

extension Detail: Identifiable {
    
}
