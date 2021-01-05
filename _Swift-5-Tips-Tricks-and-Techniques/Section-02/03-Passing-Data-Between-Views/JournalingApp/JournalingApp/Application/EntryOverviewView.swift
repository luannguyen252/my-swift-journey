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
    
    @ObservedObject var entryModel: EntryModel
    
    var body: some View {
        NavigationView {
            List(entryModel.entries, id: \.id) { entry in
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
                    CreateEntryView(entryModel: self.entryModel)
                }
            }
        }
    }
}

struct EntryOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        EntryOverviewView(entryModel: EntryModel(entries: sampleEntries))
    }
}
