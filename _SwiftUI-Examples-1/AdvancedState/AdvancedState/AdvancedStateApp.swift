//
//  AdvancedStateApp.swift
//  AdvancedState
//
//  Created by Luan Nguyen on 15/01/2021.
//

import SwiftUI

@main
struct AdvancedStateApp: App {
    let settings = UserSettings()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
        }
    }
}
