//
//  tmpApp.swift
//  tmp
//
//  Created by Elias Lankinen on 10/5/20.
//

import SwiftUI

@main
struct tmpApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
