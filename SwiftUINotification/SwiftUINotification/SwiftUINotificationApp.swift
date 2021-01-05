//
//  SwiftUINotificationApp.swift
//  SwiftUINotification
//
//  Created by Luan Nguyen on 05/01/2021.
//

import SwiftUI

@main
struct SwiftUINotificationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(SendNotification())
        }
    }
}
