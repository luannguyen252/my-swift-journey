//
//  WatchAppRatingSwiftUIApp.swift
//  WatchAppRatingSwiftUI WatchKit Extension
//
//  Created by Shreyas Vilaschandra Bhike on 05/03/21.
//

import SwiftUI

@main
struct WatchAppRatingSwiftUIApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
