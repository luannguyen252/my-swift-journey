//
//  DevuiApp.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import SwiftUI
import Resolver

@main
struct DevuiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { AuthService() }.scope(application)
        register { NetworkService(auth: resolve()) }.scope(application)
    }
}
