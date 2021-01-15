//
//  ToDoItem+CoreDataClass.swift
//  CoreDataToDo
//
//  Created by Arlan on 10/19/20.
//
//

import Foundation
import CoreData


public class ToDoItem: NSManagedObject, Identifiable {
    @NSManaged public var createdAt: Date?
    @NSManaged public var title: String?
}
