//
//  Movie_DB_SwiftUIApp.swift
//  Shared
//
//  Created by Vidhyadharan on 28/12/20.
//

import SwiftUI

@main
struct Movie_DB_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MoviesListView()
                .environment(\.managedObjectContext, persistenceController.viewContext)
        }
    }
}
