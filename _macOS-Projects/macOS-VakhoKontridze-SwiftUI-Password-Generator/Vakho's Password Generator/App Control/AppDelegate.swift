//
//  AppDelegate.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 8/29/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Cocoa

// MARK: App Delegate
/*@NSApplicationMain*/ final class AppDelegate: NSObject {
    let settings: SettingsViewModel = .init()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container: NSPersistentContainer = .init(name: "Vakho_s_Password_Generator")

        container.persistentStoreDescriptions.append({
            let description: NSPersistentStoreDescription = .init()
            description.shouldMigrateStoreAutomatically = true
            description.shouldInferMappingModelAutomatically = true
            return description
        }())
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in })
        
        return container
    }()
    
    var moc: NSManagedObjectContext { persistentContainer.viewContext }
}

// MARK:- App Delegate
extension AppDelegate: NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        PasswordGeneratorController.shared.settings = settings
        
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

// MARK:- Core Data
extension AppDelegate {
    @IBAction func saveAction(_ sender: AnyObject?) -> Void {
        if moc.hasChanges {
            do {
                try moc.save()
            } catch let error as NSError {
                NSApp.presentError(error)
            }
        }
    }

    func windowWillReturnUndoManager(window: NSWindow) -> UndoManager? { moc.undoManager }
}

// MARK:- Terminate
extension AppDelegate {
    static func terminateApp() {
        exit(0)
    }
}
