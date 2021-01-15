//
//  UserDefaultStorage.swift
//  PokeMaster
//
//  Created by huhsx on 2020/8/3.
//  Copyright © 2020 huhsx. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefaultStorage {
    
    var value: Bool
    
    let key: String
    
    init(key: String) {
        
        self.key = key
        
        value = UserDefaults.standard.bool(forKey: key)
    }
    
    var wrappedValue: Bool {
        
        get {
            value
        }
        
        set {
            
            value = newValue
            
            UserDefaults.standard.set(value, forKey: key)
        }
    }
}
