//
//  SettingsManager.swift
//  Paperboard
//
//  Created by Andrey Tchernov on 17.08.2018.
//  Copyright © 2018 Ice Rock. All rights reserved.
//

import Foundation

class SettingsStorage: NSObject {
    private let defaults: UserDefaults
        
    enum Settings: String {
        case columns
        case locale
        
        fileprivate var defaultsKey: String {
            get {
                return "settings.\(self.rawValue)"
            }
        }
    }
    
    override init() {
        if let appGroupDefaults = UserDefaults.init(suiteName: Constants.appGroup) {
            defaults = appGroupDefaults
        } else {
            defaults = UserDefaults.standard
        }
        super.init()
    }

    
    func update(_ setting: Settings, withValue value: Any?) {
        defaults.set(value, forKey: setting.defaultsKey)
        defaults.synchronize()
    }
    
    func getSettingValue(_ setting: Settings) -> Any? {
        return defaults.object(forKey: setting.defaultsKey)
    }
}
