//
//  PinterestApp.swift
//  Shared
//
//  Created by Balaji on 06/12/20.
//

import SwiftUI

@main
struct PinterestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // hiding Title Bar...
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}
