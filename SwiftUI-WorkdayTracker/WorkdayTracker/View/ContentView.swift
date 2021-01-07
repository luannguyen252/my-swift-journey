//
//  ContentView.swift
//  WorkdayTracker
//
//  Created by Oded Golden on 20/09/2020.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @EnvironmentObject var trackerModel: TrackerModel
    
    var body: some View {
        TabView{
            DaysView().tabItem {
                Text("Days")
                Image(systemName: "list.bullet")
            }
            SettingsView().tabItem {
                Text("Settings")
                Image(systemName: "pencil")
            }
            MapView().tabItem {
                Text("Stats")
                Image(systemName: "chart.bar")
            }
        }.navigationTitle("Settings")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
