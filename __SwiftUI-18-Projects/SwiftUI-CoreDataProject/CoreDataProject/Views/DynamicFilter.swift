//
//  DynamicFilter.swift
//  CoreDataProject
//
//  Created by Sandesh on 15/11/20.
//  Copyright © 2020 devsandesh. All rights reserved.
//

import SwiftUI

struct DynamicFilter: View {
    
    @Environment(\.managedObjectContext) var moc
    @State var lastNameFilter = "A"
    var body: some View {
        VStack {
            FilteredList(filterKey: "lastName",
                         filterValue: lastNameFilter, predicate: .beginsWith,
                         sortDescriptor: []) { (singer: Singer)  in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let freddy = Singer(context: self.moc)
                freddy.firstName = "Freddy"
                freddy.lastName = "Mercury"
                
                let ketty = Singer(context: self.moc)
                ketty.firstName = "Ketty"
                ketty.lastName = "Perry"
                
                let adel = Singer(context: self.moc)
                adel.firstName = "Adele"
                adel.lastName = "Adkings"
                
                try? self.moc.save()
            }
            
            Button("Show A") {
                self.lastNameFilter = "A"
            }
            
            Button("Show S") {
                self.lastNameFilter = "S"
            }
        }
    }
}

struct DynamicFilter_Previews: PreviewProvider {
    static var previews: some View {
        DynamicFilter()
    }
}
