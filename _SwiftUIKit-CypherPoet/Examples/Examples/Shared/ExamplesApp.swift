//
//  ExamplesApp.swift
//  Shared
//
//  Created by CypherPoet on 8/19/20.
//

import SwiftUI

@main
struct ExamplesApp: App {

    let store = AppStore(
        initialState: .init(),
        reducer: AppState.defaultReducer,
        middlewareRunners: [
            GalaxiesState.makeMiddleware(),
            AppState.makeLoggingMiddleware(),
        ]
    )
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(store)
        }
    }
}
