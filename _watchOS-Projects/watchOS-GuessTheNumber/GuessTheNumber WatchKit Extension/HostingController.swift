//
//  HostingController.swift
//  GuessTheNumber WatchKit Extension
//
//  Created by McCoy Zhu on 5/10/20.
//  Copyright © 2020 McCoy Zhu. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

var guessData = GuessData()

final class GuessData: ObservableObject {
    @Published var quickAction = QuickAction.none
    @Published var upperRange = 99
    @Published var usingHex = false
    var userGuessingCorrectNumber = 0
    var userLastCheckedNumber = -1
    @Published var userGuessedNumber = -1
    @Published var userGuessedTimes = 0
    var aiGuessingLowerLimit = 0
    var aiGuessingUpperLimit = 99
    @Published var aiGuessedNumber = Int((0 + 99 + Int.random(in: 0 ... 1)) / 2)
    @Published var aiGuessedTimes = 0
    @Published var randomNumber = Int.random(in: 0 ..< 99 + 1)
    @Published var randomR = Int.random(in: 0 ..< 256)
    @Published var randomG = Int.random(in: 0 ..< 256)
    @Published var randomB = Int.random(in: 0 ..< 256)
    @Published var randomDouble = Double.random(in: -10.0 ... 10.0)
    @Published var isUserGuessing = false
    @Published var isAiGuessing = false
    @Published var isInRandomizer = false
    @Published var isRandomizingNumber = false
    @Published var isRandomizingColor = false
    @Published var isRandomizingBoolean = false
    @Published var isInSettings = false
    @Published var isEditingQuickAction = false
    @Published var isEditingUpperRange = false
    @Published var showCompareResult = false
    @Published var showAiResult = false
    @Published var hasAiWon = false
    @Published var askWhenUserGuessing = false
    @Published var askWhenAiGuessing = false
    @Published var warnUpperRange = false
    @Published var warnMultiComplication = false
    @Published var promptMultiComplication = false
    
    enum QuickAction: String, CaseIterable {
        case none = "None"
        case letMeGuess = "Let Me Guess"
        case letAiGuess = "Let AI Guess"
        case randomizer = "Randomizer"
        case randomNumber = "Random Number"
        case randomColor = "Random Color"
        case randomBoolean = "Random Boolean"
    }
    
    var userGotCorrectNumber: Bool {
        return self.userGuessedNumber == self.userGuessingCorrectNumber && self.userLastCheckedNumber == self.userGuessedNumber
    }
    
    func wasUserGuessing() -> Bool {
        return (self.isUserGuessing && self.userGuessedNumber != -1)
    }
    
    func wasAiGuessing() -> Bool {
        return (self.isAiGuessing && self.aiGuessedTimes > 0)
    }
    
    func resetUpperRange(_ resetUpperRange: Int, shouldStore: Bool = false) {
        self.upperRange = resetUpperRange
        self.aiGuessingUpperLimit = resetUpperRange
        self.aiGuessedNumber = Int((0 + resetUpperRange + Int.random(in: 0 ... 1)) / 2)
        self.randomNumber = Int.random(in: 0 ..< resetUpperRange + 1)
        if shouldStore {
            UserDefaults.standard.set(resetUpperRange, forKey: "userSetUpperRange")
        }
    }
    
    func resetViews(resetAlerts: Bool = true) {
        self.isUserGuessing = false
        self.isAiGuessing = false
        self.isRandomizingNumber = false
        self.isRandomizingColor = false
        self.isRandomizingBoolean = false
        self.isInRandomizer = false
        self.isEditingQuickAction = false
        self.isEditingUpperRange = false
        self.isInSettings = false
        if resetAlerts {
            self.showCompareResult = false
            self.showAiResult = false
        }
        self.warnUpperRange = false
        self.promptMultiComplication = false
    }
    
    func storeUserGuessingStatus() {
        UserDefaults.standard.set(true, forKey: "shouldRestoreUserGamingStatus")
        UserDefaults.standard.set(self.userGuessingCorrectNumber, forKey: "userGuessingCorrectNumber")
        UserDefaults.standard.set(self.userLastCheckedNumber, forKey: "userLastCheckedNumber")
        UserDefaults.standard.set(self.userGuessedNumber, forKey: "userGuessedNumber")
        UserDefaults.standard.set(self.userGuessedTimes, forKey: "userGuessedTimes")
        UserDefaults.standard.set(self.showCompareResult, forKey: "showCompareResult")
    }
    
    func storeAiGuessingStatus() {
        UserDefaults.standard.set(true, forKey: "shouldRestoreAiGamingStatus")
        UserDefaults.standard.set(self.aiGuessingLowerLimit, forKey: "aiGuessingLowerLimit")
        UserDefaults.standard.set(self.aiGuessingUpperLimit, forKey: "aiGuessingUpperLimit")
        UserDefaults.standard.set(self.aiGuessedNumber, forKey: "aiGuessedNumber")
        UserDefaults.standard.set(self.aiGuessedTimes, forKey: "aiGuessedTimes")
        UserDefaults.standard.set(self.showAiResult, forKey: "showAiResult")
        UserDefaults.standard.set(self.hasAiWon, forKey: "hasAiWon")
    }
    
    @discardableResult func tryRestoreUserGuessingStatus() -> Bool {
        guard UserDefaults.standard.bool(forKey: "shouldRestoreUserGamingStatus") else {
            return false
        }
        
        self.userGuessingCorrectNumber = UserDefaults.standard.integer(forKey: "userGuessingCorrectNumber")
        self.userLastCheckedNumber = UserDefaults.standard.integer(forKey: "userLastCheckedNumber")
        self.userGuessedNumber = UserDefaults.standard.integer(forKey: "userGuessedNumber")
        self.userGuessedTimes = UserDefaults.standard.integer(forKey: "userGuessedTimes")
        self.showCompareResult = UserDefaults.standard.bool(forKey: "showCompareResult")
        self.launchUserGuessing(reset: false)
        for key in ["shouldRestoreUserGamingStatus", "userGuessingCorrectNumber", "userGuessedNumber", "userGuessedTimes", "showCompareResult"] {
            UserDefaults.standard.removeObject(forKey: key)
        }
        
        return true
    }
    
    @discardableResult func tryRestoreAiGuessingStatus() -> Bool {
        guard UserDefaults.standard.bool(forKey: "shouldRestoreAiGamingStatus") else {
            return false
        }
        
        self.aiGuessingLowerLimit = UserDefaults.standard.integer(forKey: "aiGuessingLowerLimit")
        self.aiGuessingUpperLimit = UserDefaults.standard.integer(forKey: "aiGuessingUpperLimit")
        self.aiGuessedNumber = UserDefaults.standard.integer(forKey: "aiGuessedNumber")
        self.aiGuessedTimes = UserDefaults.standard.integer(forKey: "aiGuessedTimes")
        self.showAiResult = UserDefaults.standard.bool(forKey: "showAiResult")
        self.hasAiWon = UserDefaults.standard.bool(forKey: "hasAiWon")
        self.launchAiGuessing(reset: false)
        for key in ["shouldRestoreAiGamingStatus", "aiGuessingLowerLimit", "aiGuessingUpperLimit", "aiGuessedNumber", "aiGuessedTimes", "showAiResult", "hasAiWon"] {
            UserDefaults.standard.removeObject(forKey: key)
        }
        
        return true
    }
    
    func resetUserGuessing() {
        self.userGuessingCorrectNumber = Int.random(in: 0 ..< self.upperRange + 1)
        self.userLastCheckedNumber = -1
        self.userGuessedNumber = -1
        self.userGuessedTimes = 0
    }
    
    func resetAiGuessing() {
        self.aiGuessingLowerLimit = 0
        self.aiGuessingUpperLimit = self.upperRange
        self.aiGuessedNumber = Int((self.aiGuessingLowerLimit + self.aiGuessingUpperLimit + Int.random(in: 0 ... 1)) / 2)
        self.aiGuessedTimes = 0
    }
    
    func resetRandomNumber() {
        self.randomNumber = Int.random(in: 0 ..< self.upperRange + 1)
    }
    
    func resetRandomColor() {
        self.randomR = Int.random(in: 0 ..< 256)
        self.randomG = Int.random(in: 0 ..< 256)
        self.randomB = Int.random(in: 0 ..< 256)
    }
    
    func resetRandomBoolean() {
        self.randomDouble = Double.random(in: -10.0 ... 10.0)
    }
    
    func launchUserGuessing(reset: Bool = true) {
        self.resetViews(resetAlerts: reset)
        if reset {
            self.resetUserGuessing()
        }
        self.isUserGuessing = true
    }
    
    func launchAiGuessing(reset: Bool = true) {
        self.resetViews(resetAlerts: reset)
        if reset {
            self.resetAiGuessing()
        }
        self.isAiGuessing = true
    }
    
    func launchRandomizer() {
        self.resetViews()
        self.isInRandomizer = true
    }
    
    func launchRandomNumber() {
        self.resetViews()
        self.resetRandomNumber()
        self.isInRandomizer = true
        self.isRandomizingNumber = true
    }
    
    func launchRandomColor() {
        self.resetViews()
        self.resetRandomColor()
        self.isInRandomizer = true
        self.isRandomizingColor = true
    }
    
    func launchRandomBoolean() {
        self.resetViews()
        self.resetRandomBoolean()
        self.isInRandomizer = true
        self.isRandomizingBoolean = true
    }
    
    func autoRedirect(reset: Bool = true) {
        if WKExtension.shared().applicationState == .active {
            var action: QuickAction
            
            if #available(watchOSApplicationExtension 7.0, *) {
                action = currentAction ?? .none
            } else {
                action = self.quickAction
            }
            
            switch action {
                case .letMeGuess:
                    self.launchUserGuessing(reset: reset)
                case .letAiGuess:
                    self.launchAiGuessing(reset: reset)
                case .randomizer:
                    self.launchRandomizer()
                case .randomNumber:
                    self.launchRandomNumber()
                case .randomColor:
                    self.launchRandomColor()
                case .randomBoolean:
                    self.launchRandomBoolean()
                default:
                    break
            }
            
            currentAction = nil
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                self.autoRedirect()
            }
        }
    }
}

class HostingController: WKHostingController<AnyView> {
    override var body: AnyView {
        return AnyView(ContentView().environmentObject(guessData))
    }
}
