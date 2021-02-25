//
//  DBViewModel.swift
//  RealmDataBase (iOS)
//
//  Created by Balaji on 05/01/21.
//

import SwiftUI
import RealmSwift

class DBViewModel: ObservableObject {

    // Data...
    @Published var title = ""
    @Published var detail = ""
    
    @Published var openNewPage = false
    
    // Fetched Data...
    @Published var cards : [Card] = []
    
    // Data Updation...
    @Published var updateObject : Card?
    
    
    init() {
        fetchData()
    }
    
    // Fetching Data...
    
    func fetchData(){
        
        guard let dbRef = try? Realm() else{return}
        
        let results = dbRef.objects(Card.self)
        
        // Displaying results...
        
        self.cards = results.compactMap({ (card) -> Card? in
            return card
        })
    }
    
    // Adding New Data...
    
    func addData(presentation: Binding<PresentationMode>){
        
        if title == "" || detail == ""{return}
        
        let card = Card()
        card.title = title
        card.detail = detail
        
        // Getting Refrence....
        
        guard let dbRef = try? Realm() else{return}
        
        // Writing Data...
        
        try? dbRef.write{
            
            
            // Checking and Writing Data....
            
            guard let availableObject = updateObject else{
                
                dbRef.add(card)
                return
            }
            
            availableObject.title = title
            availableObject.detail = detail
        }
        
        // Updating UI
        fetchData()
        
        
        // CLosing View...
        presentation.wrappedValue.dismiss()
    }
    
    // Deleting Data...
    
    func deleteData(object: Card){
        
        guard let dbRef = try? Realm() else{return}
        
        try? dbRef.write{
            
            dbRef.delete(object)
            
            fetchData()
        }
    }
    
    // Setting And Clearing Data...
    
    func setUpInitialData(){
        
        // Updation...
        
        guard let updateData = updateObject else{return}
        
        // Checking if it's update object and assigning values...
        
        title = updateData.title
        detail = updateData.detail
    }
    
    func deInitData(){
        
        updateObject = nil
        title = ""
        detail = ""
    }
}
