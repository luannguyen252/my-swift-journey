//
//  DataManager.swift
//  RunUhooi
//
//  Created by Takuto Nakamura on 2020/10/31.
//

import Foundation

fileprivate let RESET_DATA = false

class DataManager {

    static let shared = DataManager()

    private let userDefaults = UserDefaults.standard

    var meta: RunnerMeta {
        get {
            let id = userDefaults.integer(forKey: "runnerId")
            return RunnerMeta(id: id)!
        }
        set { userDefaults.set(newValue.id, forKey: "runnerId") }
    }

    var showCPU: Bool {
        get { return userDefaults.bool(forKey: "cpu") }
        set { userDefaults.set(newValue, forKey: "cpu") }
    }

    private init() {
        #if DEBUG
        if RESET_DATA {
            userDefaults.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        }
        #endif
        userDefaults.register(defaults: ["cpu": true])
    }

}
