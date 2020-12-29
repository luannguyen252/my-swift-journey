//
//  SimpleWatchAppApp.swift
//  SimpleWatchApp WatchKit Extension
//
//  Created by Luan Nguyen on 29/12/2020.
//

import SwiftUI

@main
struct SimpleWatchAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(isPlaying: true)
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
