//
//  HookUpApp.swift
//  HookUp
//
//  Created by Daval Cato on 8/15/20.
//

import SwiftUI
import Firebase

@main
struct HookUpApp: App {
    
    @UIApplicationDelegateAdaptor(Delegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// Here we connect with Firebase...

class Delegate : NSObject, UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        
        return true
    }
}
