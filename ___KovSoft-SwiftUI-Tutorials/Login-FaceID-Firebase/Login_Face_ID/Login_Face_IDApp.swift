//
//  Login_Face_IDApp.swift
//  Login_Face_ID
//
//  Created by Balaji on 21/09/20.
//

import SwiftUI
import Firebase

@main
struct Login_Face_IDApp: App {
    
    @UIApplicationDelegateAdaptor(Delegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// Intializing FIrebase...

class Delegate : NSObject,UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
