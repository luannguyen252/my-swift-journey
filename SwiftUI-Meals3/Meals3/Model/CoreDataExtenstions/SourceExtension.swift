//
//  SourceExtension.swift
//  meals
//
//  Created by Uwe Petersen on 06.02.15.
//  Copyright (c) 2015 Uwe Petersen. All rights reserved.
//

import Foundation
import CoreData


extension Source {
    
    class func createSourceWithName(_ name: String, inManagedObjectContext context: NSManagedObjectContext) -> Source {
        let source = Source(context: context)
        source.name = name
        return source
    }

    
    class func fetchSourcesForName(_ name: String, managedObjectContext context: NSManagedObjectContext) -> [Source]? {
        
        // returns the food detail information matching the detail number and the group characters in the bls-key-string for the current food.
        let request: NSFetchRequest<Source> = Source.fetchRequest()
        request.predicate = NSPredicate(format: "name = '\(name)'")
                
        do {
            let sources = try context.fetch(request)
            return sources
        } catch {
            print("Error fetching all sources: \(error)")
            return nil
        }
    }
}
