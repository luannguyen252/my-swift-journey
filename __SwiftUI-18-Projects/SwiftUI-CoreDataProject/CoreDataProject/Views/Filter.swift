//
//  Filter.swift
//  CoreDataProject
//
//  Created by Sandesh on 14/10/20.
//  Copyright © 2020 devsandesh. All rights reserved.
//

import SwiftUI
import CoreData

struct Filter: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Ship.entity(),
                  sortDescriptors: [],
                  predicate: NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e")) var ships: FetchedResults<Ship>
    
     
    
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown")
            }
            
            Button("Add Examples") {
                let ship1 = Ship(context: moc)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"
                
                let ship2 = Ship(context: moc)
                ship2.name = "Milennium"
                ship2.universe = "Star Trek"
                
                let ship3 = Ship(context: moc)
                ship3.name = "HeloRing"
                ship3.universe = "Star Wars"
                
                let ship4 = Ship(context: moc)
                ship4.name = "Stella"
                ship4.universe = "Star Wars"
                
                try? moc.save()
            }
        }
    }
}

struct Filter_Previews: PreviewProvider {
    static var previews: some View {
        Filter()
    }
}
