//
//  AppleWatchAppApp.swift
//  AppleWatchApp WatchKit Extension
//
//  Created by Tony Hajdini on 03/10/2020.
//

import SwiftUI

@main
struct AppleWatchAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
