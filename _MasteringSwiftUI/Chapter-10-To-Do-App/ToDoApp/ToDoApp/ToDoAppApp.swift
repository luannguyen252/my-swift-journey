//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    // MARK: - PERSISTENCE CONTROLLER
    let persistenceController = PersistenceController.shared
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
