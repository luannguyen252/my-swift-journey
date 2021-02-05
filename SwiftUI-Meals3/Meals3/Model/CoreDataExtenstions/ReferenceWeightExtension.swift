//
//  ReferenceWeightExtension.swift
//  meals
//
//  Created by Uwe Petersen on 01.02.15.
//  Copyright (c) 2015 Uwe Petersen. All rights reserved.
//

import Foundation
import CoreData

//Last (seventh) characters defines the referenceWeight

extension ReferenceWeight {
    
    /// Returns the referenceWeight matching the referenceWeight number in the bls-key-string (7th position) for the current food.
    /// E.g. the referenceWeight with name "Handelsüblich ohne Küchenabfall" (which has the key "0") will 
    /// be returned for the food with key "B105100" where the seventh character (i.e. number) denotes the referenceWeight and is a "0".
    class func fetchReferenceWeightForBLSReferenceWeightKey(_ key: String, inManagedObjectContext context: NSManagedObjectContext) -> ReferenceWeight? {
        
        let request: NSFetchRequest<ReferenceWeight> = ReferenceWeight.fetchRequest()
        request.predicate = NSPredicate(format: "key = '\(key)'")

        do {
            let referenceWeights = try context.fetch(request)
            assert(referenceWeights.count <= 1, "Error fetching referenceWeights from csv-File for key '\(key)':\n There is more than one referenceWeights returned for this food. ReferenceWeights are: \(referenceWeights)")
            return referenceWeights.first
        } catch {
            print("Error fetching referenceWeights from csv-file for key '\(key)': Corresponding referenceWeights not found.'")
            return nil
        }
    }
}

extension ReferenceWeight: Identifiable {
    
}
