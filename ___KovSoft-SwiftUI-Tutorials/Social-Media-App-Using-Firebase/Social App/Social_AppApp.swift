//
//  Social_AppApp.swift
//  Social App
//
//  Created by Balaji on 14/09/20.
//

import SwiftUI
import Firebase

@main
struct Social_AppApp: App {
    @UIApplicationDelegateAdaptor(Appdelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in
                    
                    Auth.auth().canHandle(url)
                })
        }
    }
}

// Intalizing Firebase

class Appdelegate : NSObject,UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
    
    // Its Also Should Be Implemeted...
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
    }
}
