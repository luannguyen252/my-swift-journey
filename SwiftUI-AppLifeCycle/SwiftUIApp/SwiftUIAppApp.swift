//
//  SwiftUIAppApp.swift
//  SwiftUIApp
//
//  Created by 帝云科技 on 2020/10/30.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Application didFinishLaunchingWithOptions")
        return true
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("willFinishLaunchingWithOptions")
        return true
    }
}

@main
struct SwiftUIAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @Environment(\.scenePhase) var scenePhase
    
    init() {
        print("Application is starting...")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in
                    print("Received URL: \(url)")
                })
        }
        .onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active:
                print("Application is active")
            case .inactive:
                print("Application is inactive")
            case .background:
                print("Application is background")
            default:
                print("unexpected value.")
            }
        }
    }
}
