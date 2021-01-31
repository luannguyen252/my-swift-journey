//
//  SwiftUICoreDataApp.swift
//  SwiftUICoreData
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

@main
struct SwiftUICoreDataApp: App {
    // MARK: - PROPERTIES
    let persistenceController = PersistenceController.shared
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
