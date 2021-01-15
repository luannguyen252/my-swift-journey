//
//  GlobalDataView.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 11.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import SwiftUI
import Combine

struct GlobalDataView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Country.entity(), sortDescriptors: [
        NSSortDescriptor(key: "active", ascending: false)
    ]) var countries: FetchedResults<Country>
    
    @ObservedObject var viewModel = GlobalDataViewModel()
    
    var body: some View {
        NavigationView {
            List {
                if viewModel.globalData != nil {
                    Section(header: Text(verbatim: "Last update: " + viewModel.currentDateString)) {
                        GlobalDataRow(globalData: viewModel.globalData!)
                    }
                }
                Section {
                    if !countries.isEmpty {
                        CountryHeaderRow()
                    }
                    ForEach(countries, id: \.id) { country in
                        NavigationLink(
                        destination: CountryDataView(country: country)) {
                            CountryRow(country: country)
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .onAppear {
                self.viewModel.loadData.send(())
            }
            .navigationBarTitle("Covid-19 tracker")
            .navigationBarItems(trailing:
                Button(
                    action: {
                        self.viewModel.loadData.send(())
                    },
                    label: {
                        Image(systemName: "arrow.clockwise")
                            .imageScale(.large)
                    }
                )
            )
        }
    }
}
