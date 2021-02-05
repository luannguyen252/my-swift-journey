//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Sandesh on 13/07/20.
//  Copyright © 2020 devsandesh. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
       DynamicFilter()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
