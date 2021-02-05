//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Sandesh on 15/11/20.
//  Copyright © 2020 devsandesh. All rights reserved.
//

import SwiftUI
import CoreData

enum Predicate: String {
    case beginsWith = "BEGINSWITH"
    case equals = "=="
    case contais = "CONTAINS"
    case greaterThan = ">"
    case greaterThanEqualTo = ">="
    case lessThan = "<"
    case lessThanEqualTo = "<="
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> {
        fetchRequest.wrappedValue
    }
    let content: (T) -> Content
    
    var body: some View {
        List(singers, id: \.self) { singer in
            self.content(singer )
        }
    }
    
    init(filterKey: String,
         filterValue: String,
         predicate: Predicate,
         sortDescriptor: [NSSortDescriptor],
         @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: Singer.entity(),
                                            sortDescriptors: sortDescriptor,
                                            predicate: NSPredicate(format: "%K \(predicate.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
}
