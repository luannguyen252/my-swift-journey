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
    
    private let network = RequestEntries()
    
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
    
    init(entryModel: EntryModel) {
        self.entryModel = entryModel
        refresh()
    }
    
    private func refresh() {
        entryModel.entries.removeAll()
        network.requestAllEntries { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let entries):
                self.entryModel.entries.append(contentsOf: entries)
            }
        }
    }
}

struct EntryOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        EntryOverviewView(entryModel: EntryModel(entries: sampleEntries))
    }
}
