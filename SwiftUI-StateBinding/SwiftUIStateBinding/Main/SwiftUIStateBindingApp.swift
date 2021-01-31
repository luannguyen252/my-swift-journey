//
//  SwiftUIStateBindingApp.swift
//  SwiftUIStateBinding
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

@main
struct SwiftUIStateBindingApp: App {
    // MARK: - PROPERTIES
    var settings = UserSettings()
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            TabbedView()
                .environmentObject(settings)
        }
    }
}
