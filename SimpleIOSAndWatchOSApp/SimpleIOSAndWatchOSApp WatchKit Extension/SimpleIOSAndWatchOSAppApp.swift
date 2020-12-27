//
//  SimpleIOSAndWatchOSAppApp.swift
//  SimpleIOSAndWatchOSApp WatchKit Extension
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

@main
struct SimpleIOSAndWatchOSAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
