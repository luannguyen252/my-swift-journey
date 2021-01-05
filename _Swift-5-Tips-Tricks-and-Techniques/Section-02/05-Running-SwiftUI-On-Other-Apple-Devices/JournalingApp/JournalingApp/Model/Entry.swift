//
//  Entry.swift
//  JournalingApp
//
//  Created by Philipp Baldauf on 17.12.19.
//  Copyright © 2019 Philipp Baldauf. All rights reserved.
//

import Foundation
import CoreData

public class Entry: NSManagedObject, Identifiable {

    @NSManaged public var created: Date
    @NSManaged public var title: String
    @NSManaged public var text: String
    @NSManaged private var categoryType: Int64
    
    var category: Category {
        get {
            return Category(rawValue: Int(categoryType))!
        }
        set {
            categoryType = Int64(newValue.rawValue)
        }
    }
}

extension Entry {

    class func sortedFetchRequest() -> NSFetchRequest<Entry> {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.sortDescriptors = [NSSortDescriptor(key: "created", ascending: true)]
        return request
    }
}
