//
//  UserDefaults+helps.swift
//  Nozee
//
//  Created by Daval Cato on 7/14/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import Foundation

//This helps to save values to userDefaults
extension UserDefaults {
    
    func setIsLoggedIn(value: Bool) {
        set(value, forKey: "isLoggedIn")
        synchronize()
    }
    
    func isLoggedIn() -> Bool {
        return bool(forKey: "isLoggedIn")
    }
    
}















