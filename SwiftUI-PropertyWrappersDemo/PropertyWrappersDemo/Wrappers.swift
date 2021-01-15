//
//  Wrappers.swift
//  PropertyWrappersDemo
//
//  Created by Alfian Losari on 10/11/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import Foundation

@propertyWrapper
struct Uppercased {
    private var text: String
    var wrappedValue: String {
        get { text.uppercased() }
        set { text = newValue }
    }
    init(wrappedValue: String)  {
        self.text = wrappedValue
    }
}

@propertyWrapper
struct Ranged<T: Comparable> {
    private var minimum: T
    private var maximum: T
    private var value: T
    var wrappedValue: T {
        get { value }
        set {
            if newValue > maximum {
                value = maximum
            } else if newValue < minimum {
                value = minimum
            } else {
                value = newValue
            }
        }
    }
    init(wrappedValue: T, minimum: T, maximum: T) {
        self.minimum = minimum
        self.maximum = maximum
        self.value = wrappedValue
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
struct Localizable {
    private var key: String
    var wrappedValue: String {
        get { NSLocalizedString(key, comment: "") }
        set { key = newValue }
    }
    init(wrappedValue: String) {
        self.key = wrappedValue
    }
}

@propertyWrapper
struct ISO8601DateFormatted {
    static private let formatter = ISO8601DateFormatter()
    var projectedValue: String { ISO8601DateFormatted.formatter.string(from: wrappedValue) }
    var wrappedValue: Date
}

@propertyWrapper
struct UserDefault<T> {
    var key: String
    var initialValue: T
    var wrappedValue: T {
        set { UserDefaults.standard.set(newValue, forKey: key) }
        get { UserDefaults.standard.object(forKey: key) as? T ?? initialValue }
    }
}

enum UserPreferences {
    @UserDefault(key: "isCheatModeEnabled", initialValue: false) static var isCheatModeEnabled: Bool
    @UserDefault(key: "isNoRandomBattleEnabled", initialValue: false) static var isNoRandomBattleEnabled: Bool
    @UserDefault(key: "isGodModeEnabled", initialValue: false) static var isGodModeEnabled: Bool
    @UserDefault(key: "isSephirothEnabledInParty", initialValue: false) static var isSephirothEnabledInParty: Bool
    
    @UserDefault(key: "gamePlaySpeed", initialValue: 1) static var gamePlaySpeed: Int
    @UserDefault(key: "highestScore", initialValue: 0) static var highestScore: Int
    @UserDefault(key: "nickname", initialValue: "") static var nickname: String
}
