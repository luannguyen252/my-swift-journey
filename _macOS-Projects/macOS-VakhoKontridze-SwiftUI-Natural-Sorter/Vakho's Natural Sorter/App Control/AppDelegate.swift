//
//  AppDelegate.swift
//  Vakho's Natural Sorter
//
//  Created by Vakhtang Kontridze on 9/20/20.
//

import Cocoa

// MARK: App Delegate
/*@NSApplicationMain*/ final class AppDelegate: NSObject {
    let settings: SettingsViewModel = .init()
}

// MARK:- App Delegate
extension AppDelegate: NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        MainWindow.shared.createWindow()
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        true
    }
}

// MARK: App Name
extension AppDelegate {
    static var appName: String {
        ProcessInfo.processInfo.processName
    }
}

// MARK:- Terminate
extension AppDelegate {
    static func terminateApp() {
        exit(0)
    }
}
