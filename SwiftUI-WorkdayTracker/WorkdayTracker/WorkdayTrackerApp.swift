//
//  WorkdayTrackerApp.swift
//  WorkdayTracker
//
//  Created by Oded Golden on 20/09/2020.
//

import SwiftUI

@main
struct WorkdayTrackerApp: App {
    let persistenceController = PersistenceController.shared
    let geoManager = GeoManager(using: PersistenceController.shared.container.viewContext)
    @ObservedObject private var trackerModel = TrackerModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(trackerModel)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
