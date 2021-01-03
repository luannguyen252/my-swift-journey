//
//  RealtimeChatMessengerFirebaseApp.swift
//  RealtimeChatMessengerFirebase
//
//  Created by Luan Nguyen on 03/01/2021.
//

import Firebase
import SwiftUI

// MARK: - IMPORT FIREBASE LIBRARY
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct RealtimeChatMessengerFirebaseApp: App {
    // MARK: - ADD APP DELEGATE PROPERTY TO COMPLETE FIREBASE SETUP
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    // MARK: - VIEW ROUTER
    @StateObject var viewRouter = ViewRouter(pageToStartWith: UserDefaults.standard.string(forKey: "username") != nil ? .chatView : .loginView)
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            MotherView()
                .environmentObject(viewRouter)
        }
    }
}
