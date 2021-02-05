//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Sandesh on 13/10/20.
//  Copyright © 2020 devsandesh. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16
    
    var wrappedTitle: String {
        title ?? "Unknown"
    }
    
    var wrappedDirector: String {
        director ?? "Unknown"
    }
   
}

extension Movie : Identifiable {

}
