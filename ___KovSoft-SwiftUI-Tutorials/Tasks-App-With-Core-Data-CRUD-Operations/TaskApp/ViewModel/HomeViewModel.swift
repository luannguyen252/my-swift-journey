//
//  HomeViewModel.swift
//  TaskApp
//
//  Created by Balaji on 26/09/20.
//

import SwiftUI
import CoreData

class HomeViewModel : ObservableObject{
    
    @Published var content = ""
    @Published var date = Date()
    
    // For NewData Sheet...
    @Published var isNewData = false
    
    // Checking And Updating Date....
    
    // Storing Update Item...
    @Published var updateItem : Task!
    
    let calender = Calendar.current
    
    func checkDate()->String{
        
        if calender.isDateInToday(date){
            
            return "Today"
        }
        else if calender.isDateInTomorrow(date){
            return "Tomorrow"
        }
        else{
            return "Other day"
        }
    }
    
    func updateDate(value: String){
        
        if value == "Today"{date = Date()}
        else if value == "Tomorrow"{
            date = calender.date(byAdding: .day, value: 1, to: Date())!
        }
        else{
            // do something...
        }
    }
    
    func writeData(context : NSManagedObjectContext){
        
        // Updating Item.....
        
        if updateItem != nil{
            
            // Means Update Old Data...
            updateItem.date = date
            updateItem.content = content
            
            try! context.save()
            
            // removing updatingItem if successfull
            
            updateItem = nil
            isNewData.toggle()
            content = ""
            date = Date()
            return
        }
        
        let newTask = Task(context: context)
        newTask.date = date
        newTask.content = content
        
        // saving data...
        
        do{
            
            try context.save()
            // success means closing view...
            isNewData.toggle()
            content = ""
            date = Date()
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func EditItem(item: Task){
        
        updateItem = item
        // togging the newDataView....
        date = item.date!
        content = item.content!
        isNewData.toggle()
    }
}
