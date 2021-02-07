//
//  ExtensionDelegate.swift
//  GuessTheNumber WatchKit Extension
//
//  Created by McCoy Zhu on 5/10/20.
//  Copyright © 2020 McCoy Zhu. All rights reserved.
//

import WatchKit
import Intents
import Foundation
import ClockKit

var currentAction: GuessData.QuickAction? = nil

class ExtensionDelegate: NSObject, WKExtensionDelegate {
    var shouldPlaySfx = false
    
    enum ReopenDestination: String {
        case userGuessing, aiGuessing, randomizeNumber, randomizeColor, randomizeBoolean
    }
    
    func handle(_ userActivity: NSUserActivity) {
        if let reopenTo = ReopenDestination(rawValue: userActivity.userInfo?["reopenTo"] as? String ?? "") {
            switch reopenTo {
            case .userGuessing:
                guessData.tryRestoreUserGuessingStatus()
            case .aiGuessing:
                guessData.tryRestoreAiGuessingStatus()
            case .randomizeNumber:
                guessData.launchRandomNumber()
            case .randomizeColor:
                guessData.launchRandomColor()
            case .randomizeBoolean:
                guessData.launchRandomBoolean()
            }
        }
    }
    
    func handleUserActivity(_ userInfo: [AnyHashable : Any]?) {
        if #available(watchOSApplicationExtension 7.0, *) {
            if let identifierKey = userInfo?[CLKLaunchedComplicationIdentifierKey] as? String, let action = GuessData.QuickAction.init(rawValue: identifierKey), action != .none {
                currentAction = action
                if guessData.tryRestoreUserGuessingStatus() {
                    guessData.showCompareResult = true
                    guessData.askWhenUserGuessing = true
                    shouldPlaySfx = true
                } else if guessData.tryRestoreAiGuessingStatus() {
                    guessData.showAiResult = true
                    guessData.askWhenAiGuessing = true
                    shouldPlaySfx = true
                } else {
                    guessData.autoRedirect()
                }
            }
        } else {
            if guessData.quickAction != .none {
                if guessData.tryRestoreUserGuessingStatus() {
                    guessData.showCompareResult = true
                    guessData.askWhenUserGuessing = true
                    shouldPlaySfx = true
                } else if guessData.tryRestoreAiGuessingStatus() {
                    guessData.showAiResult = true
                    guessData.askWhenAiGuessing = true
                    shouldPlaySfx = true
                } else {
                    guessData.autoRedirect()
                }
            }
        }
    }

    func applicationDidFinishLaunching() {
        // Perform any final initialization of your application.
        guessData.quickAction = GuessData.QuickAction(rawValue: UserDefaults.standard.string(forKey: "userSetQuickAction") ?? "None") ?? GuessData.QuickAction.none
        
        let restoredUpperRange = UserDefaults.standard.integer(forKey: "userSetUpperRange")
        if restoredUpperRange != 0 {
            guessData.resetUpperRange(restoredUpperRange)
        }
        
        guessData.usingHex = UserDefaults.standard.bool(forKey: "userPrefersUsingHex")
        
        if #available(watchOSApplicationExtension 7.0, *), guessData.quickAction != .none {
            guessData.warnMultiComplication = true
            shouldPlaySfx = true
        }
    }

    func applicationDidBecomeActive() {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        if UserDefaults.standard.bool(forKey: "relevantShortcutAdded") {
            INRelevantShortcutStore.default.setRelevantShortcuts([], completionHandler: { error in
                UserDefaults.standard.set(error != nil, forKey: "relevantShortcutAdded")
            })
        }
        
        guessData.tryRestoreUserGuessingStatus()
        guessData.tryRestoreAiGuessingStatus()
        
        if shouldPlaySfx && (guessData.showCompareResult && guessData.askWhenUserGuessing && !guessData.userGotCorrectNumber || guessData.showAiResult && guessData.askWhenAiGuessing && !guessData.hasAiWon || guessData.warnMultiComplication) {
            WKInterfaceDevice.current().play(.retry)
        }
        
        shouldPlaySfx = false
    }

    func applicationWillResignActive() {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, etc.
        
        let activity = NSUserActivity(activityType: "mccoyzhu.GuessTheNumber.Reopen")
        var titleKey: String
        var destination: ReopenDestination
        var imageName: String
        
        if guessData.wasUserGuessing() {
            titleKey = "Resume Game"
            destination = .userGuessing
            imageName = "person.crop.circle.fill"
            guessData.storeUserGuessingStatus()
        } else if guessData.wasAiGuessing() {
            titleKey = "Resume Game"
            destination = .aiGuessing
            imageName = "gamecontroller.fill"
            guessData.storeAiGuessingStatus()
        } else if guessData.isInRandomizer && guessData.isRandomizingNumber {
            titleKey = "Randomize Number"
            destination = .randomizeNumber
            imageName = "textformat.123"
        } else if guessData.isInRandomizer && guessData.isRandomizingColor {
            titleKey = "Randomize Color"
            destination = .randomizeColor
            imageName = "paintbrush"
        } else if guessData.isInRandomizer && guessData.isRandomizingBoolean {
            titleKey = "Randomize Boolean"
            destination = .randomizeBoolean
            imageName = "questionmark.circle"
        } else {
            if UserDefaults.standard.bool(forKey: "relevantShortcutAdded") {
                INRelevantShortcutStore.default.setRelevantShortcuts([], completionHandler: { error in
                    UserDefaults.standard.set(error != nil, forKey: "relevantShortcutAdded")
                })
            }
            return
        }
        
        activity.title = NSLocalizedString(titleKey, comment: "")
        activity.userInfo = ["reopenTo" : destination.rawValue]
        activity.requiredUserInfoKeys = ["reopenTo"]
        activity.isEligibleForSearch = true
        activity.isEligibleForHandoff = true
        activity.isEligibleForPrediction = true
        activity.isEligibleForPublicIndexing = true
        activity.persistentIdentifier = "\((activity.userInfo?["reopenTo"] as? ReopenDestination)?.rawValue ?? "Error")\(Int.random(in: 0 ..< 100))"
        activity.becomeCurrent()
        
        let shortcut = INShortcut(userActivity: activity)
        let relevantShortcut = INRelevantShortcut(shortcut: shortcut)
        let cardTmpl = INDefaultCardTemplate(title: activity.title ?? "GuessTheNumber")
        if let symbolImage = UIImage(systemName: imageName) {
            cardTmpl.image = INImage(imageData: symbolImage.withTintColor(.white, renderingMode: .alwaysOriginal).pngData()!)
        }
        relevantShortcut.watchTemplate = cardTmpl
        relevantShortcut.relevanceProviders = [INDateRelevanceProvider(start: Date().addingTimeInterval(0), end: Date().addingTimeInterval(60))]
        
        INRelevantShortcutStore.default.setRelevantShortcuts([relevantShortcut], completionHandler: { error in
            UserDefaults.standard.set(error == nil, forKey: "relevantShortcutAdded")
        })
        
        currentAction = nil
    }

    func handle(_ backgroundTasks: Set<WKRefreshBackgroundTask>) {
        // Sent when the system needs to launch the application in the background to process tasks. Tasks arrive in a set, so loop through and process each one.
        for task in backgroundTasks {
            // Use a switch statement to check the task type
            switch task {
            case let backgroundTask as WKApplicationRefreshBackgroundTask:
                // Be sure to complete the background task once you’re done.
                backgroundTask.setTaskCompletedWithSnapshot(false)
            case let snapshotTask as WKSnapshotRefreshBackgroundTask:
                // Snapshot tasks have a unique completion call, make sure to set your expiration date
                snapshotTask.setTaskCompleted(restoredDefaultState: true, estimatedSnapshotExpiration: Date.distantFuture, userInfo: nil)
            case let connectivityTask as WKWatchConnectivityRefreshBackgroundTask:
                // Be sure to complete the connectivity task once you’re done.
                connectivityTask.setTaskCompletedWithSnapshot(false)
            case let urlSessionTask as WKURLSessionRefreshBackgroundTask:
                // Be sure to complete the URL session task once you’re done.
                urlSessionTask.setTaskCompletedWithSnapshot(false)
            case let relevantShortcutTask as WKRelevantShortcutRefreshBackgroundTask:
                // Be sure to complete the relevant-shortcut task once you're done.
                relevantShortcutTask.setTaskCompletedWithSnapshot(false)
            case let intentDidRunTask as WKIntentDidRunRefreshBackgroundTask:
                // Be sure to complete the intent-did-run task once you're done.
                intentDidRunTask.setTaskCompletedWithSnapshot(false)
            default:
                // make sure to complete unhandled task types
                task.setTaskCompletedWithSnapshot(false)
            }
        }
    }

}
