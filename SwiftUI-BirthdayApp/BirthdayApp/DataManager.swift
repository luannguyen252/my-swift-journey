//
//  DataManager.swift
//  BirthdayApp
//
//  Created by jb on 2020/10/13.
//

import Foundation
import UIKit
import CoreData

class DataManager {
    static let shared = DataManager(moc: NSManagedObjectContext.current)
    var managedContext: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext){
        self.managedContext = moc
    }
    
    //get records
    func getBirtdays() -> [Birthday]{
        var birthdays = [Birthday]()
        let bdRequest: NSFetchRequest<Birthday> = Birthday.fetchRequest()
        do {
            birthdays = try self.managedContext.fetch(bdRequest)
        }catch{
            print("Get Error : \(error)")
        }
        return birthdays
    }
    
    // save birthday
    func saveBirthday(id: UUID, name: String, date: Date){
        let birthday = Birthday(context: self.managedContext)
        birthday.id = id
        birthday.name=name
        birthday.date=date
        
        do{
            try self.managedContext.save()
        }catch{
            print("Save Error: \(error)")
        }
    }
    
    // remove birthday
    func removeBirthday(id: UUID){
        // select * from table where id = id
        let fetchRequest: NSFetchRequest<Birthday> = Birthday.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "id=%@", id.uuidString)
        do{
            let birthdays = try self.managedContext.fetch(fetchRequest)
            for birthday in birthdays {
                self.managedContext.delete(birthday)
            }
            try self.managedContext.save()
        }catch{
            print("Remove Error: \(error)")
        }
    }
    
    // update
    func updateBirthday(id: UUID, name: String, date: Date){
        let fetchRequest: NSFetchRequest<Birthday> = Birthday.fetchRequest()
        fetchRequest.predicate =  NSPredicate.init(format: "id=%@", id.uuidString)
        do{
            let birthday = try self.managedContext.fetch(fetchRequest).first //actually we know there will be only one item
            birthday?.date = date
            birthday?.name = name
            try self.managedContext.save()
        }catch{
            print("Update Error \(error)")
        }
    }
    
}

extension NSManagedObjectContext {
    static var current: NSManagedObjectContext{
        
        return persistentContainer.viewContext
    }
}

