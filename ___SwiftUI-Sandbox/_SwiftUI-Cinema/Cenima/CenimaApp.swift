//
//  CenimaApp.swift
//  Cenima
//
//  Created by mohammad mugish on 21/02/21.
//

import SwiftUI

@main
struct CenimaApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var dashboardVM = DashboardViewModel(apiClient: API_Client())
    var body: some Scene {
        WindowGroup {
            DashboardView(dashboardVM: dashboardVM)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
              
        }
    }
}
