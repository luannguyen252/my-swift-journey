//
//  EntryOverviewView.swift
//  JournalingApp
//
//  Created by Philipp Baldauf on 17.12.19.
//  Copyright © 2019 Philipp Baldauf. All rights reserved.
//

import SwiftUI

struct EntryOverviewView: View {
    
    // Access to core data managed object context
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State private var showCreateScreen = false
    
    // Entries as fetched from CoreData
    @FetchRequest(fetchRequest: Entry.sortedFetchRequest()) var entries: FetchedResults<Entry>
    
    var body: some View {
        NavigationView {
            List(entries) { entry in
                NavigationLink(destination: EntryDetailView(entry: entry)) {
                    EntryRow(entry: entry)
                }
            }
            .navigationBarTitle("Entries")
            .navigationBarItems(trailing: Button(action: {
                self.showCreateScreen.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showCreateScreen) {
                NavigationView {
                    CreateEntryView()
                    .environment(\.managedObjectContext, self.managedObjectContext)
                }
            }
        }
    }
}

struct EntryOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        EntryOverviewView()
    }
}
