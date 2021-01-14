//
//  SwiftUITwoTodoMobileApp.swift
//  SwiftUITwoTodoMobile
//
//  Created by Renaud JENNY on 30/09/2020.
//

import SwiftUI

@main
struct SwiftUITwoTodoMobileApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
