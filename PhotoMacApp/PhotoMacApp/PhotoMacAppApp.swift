//
//  PhotoMacAppApp.swift
//  PhotoMacApp
//
//  Created by Luan Nguyen on 12/12/2020.
//

import SwiftUI

@main
struct PhotoMacAppApp: App {
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle()) // Hiding Title Bar
    }
}
