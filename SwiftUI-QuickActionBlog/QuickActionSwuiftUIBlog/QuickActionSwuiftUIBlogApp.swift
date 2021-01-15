//
//  QuickActionSwuiftUIBlogApp.swift
//  QuickActionSwuiftUIBlog
//
//  Created by Thomas Prezioso on 10/25/20.
//

import SwiftUI

let quickActionSettings = QuickActionSettings()
var shortcutItemToHandle: UIApplicationShortcutItem?

@main
struct QuickActionSwuiftUIBlogApp: App {
    @Environment(\.scenePhase) var lifeCycle
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                // We will use this modifier below to pass along which quick action was pressed
                .environmentObject(quickActionSettings)
        }
        .onChange(of: lifeCycle) { (newLifeCyclePhase) in
            switch newLifeCyclePhase {
            case .active :
                print("App is active")
                guard let name = shortcutItemToHandle?.userInfo?["name"] as? String else { return }
                switch name {
                case "tweet":
                    print("tweet is selected")
                    quickActionSettings.quickAction = .details(name: name)
                case "call":
                    print("call is selected")
                    quickActionSettings.quickAction = .details(name: name)
                case "message":
                    print("message is selected")
                    quickActionSettings.quickAction = .details(name: name)
                case "saved":
                    print("saved is selected")
                    quickActionSettings.quickAction = .details(name: name)
                default:
                    print("default ")
                }
            case .inactive:
                print("App is inactive")
            case .background:
                print("App is going to the Background")
                // This will add our dynamic quick actions when our app is sent to the background on our device
                addQuickActions()
            @unknown default:
                print("default")
            }
        }
    }
    
    func addQuickActions() {
        var tweetuserInfo: [String: NSSecureCoding] {
            return ["name" : "tweet" as NSSecureCoding]
        }
        var calluserInfo: [String: NSSecureCoding] {
            return ["name" : "call" as NSSecureCoding]
        }
        var messageuserInfo: [String: NSSecureCoding] {
            return ["name" : "message" as NSSecureCoding]
        }
        var saveduserInfo: [String: NSSecureCoding] {
            return ["name" : "saved" as NSSecureCoding]
        }
        
        UIApplication.shared.shortcutItems = [
            UIApplicationShortcutItem(type: "Tweet", localizedTitle: "Tweet", localizedSubtitle: "", icon: UIApplicationShortcutIcon(type: .compose), userInfo: tweetuserInfo),
            UIApplicationShortcutItem(type: "Call", localizedTitle: "Call", localizedSubtitle: "", icon: UIApplicationShortcutIcon(type: .audio), userInfo: calluserInfo),
            UIApplicationShortcutItem(type: "Message", localizedTitle: "Message", localizedSubtitle: "", icon: UIApplicationShortcutIcon(type: .message), userInfo: messageuserInfo),
            UIApplicationShortcutItem(type: "Saved", localizedTitle: "Saved", localizedSubtitle: "", icon: UIApplicationShortcutIcon(type: .love), userInfo: saveduserInfo),
        ]
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
            if let shortcutItem = options.shortcutItem {
                shortcutItemToHandle = shortcutItem
            }
            
            let sceneConfiguration = UISceneConfiguration(name: "Custom Configuration", sessionRole: connectingSceneSession.role)
            sceneConfiguration.delegateClass = CustomSceneDelegate.self
            
            return sceneConfiguration
        }
    }
    
    class CustomSceneDelegate: UIResponder, UIWindowSceneDelegate {
        func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
            shortcutItemToHandle = shortcutItem
        }
    }
}
