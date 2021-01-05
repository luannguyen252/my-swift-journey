//
//  EntryOverviewView.swift
//  JournalingApp
//
//  Created by Philipp Baldauf on 17.12.19.
//  Copyright © 2019 Philipp Baldauf. All rights reserved.
//

import SwiftUI

struct EntryOverviewView: View {
    
    @State private var showCreateScreen = false
    
    let entries: [Entry]
    
    var body: some View {
        NavigationView {
            List(entries, id: \.id) { entry in
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
                }
            }
        }
    }
}

struct EntryOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        EntryOverviewView(entries: sampleEntries)
    }
}
