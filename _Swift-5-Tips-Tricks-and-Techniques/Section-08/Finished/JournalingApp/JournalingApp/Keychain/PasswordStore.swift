//
//  PasswordStore.swift
//  JournalingApp
//
//  Created by Philipp Baldauf on 14.03.20.
//  Copyright © 2020 Philipp Baldauf. All rights reserved.
//

import Foundation

class PasswordStore {
    
    private static let account = "com.philippbaldauf.journalingapp"
    
    func store(password: String) {
        let passwordData = password.data(using: .utf8)!
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: PasswordStore.account,
                                    kSecValueData as String: passwordData]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        switch status {
        case errSecSuccess:
            print("Password stored securly")
        default:
            print("Error storing password \(status.description)")
        }
    }
    
    func check(password: String) -> Bool {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecMatchLimit as String: kSecMatchLimitOne,
                                    kSecAttrAccount as String: PasswordStore.account,
                                    kSecReturnData as String: true]
        var result: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        switch status {
        case errSecSuccess:
            if let passwordData = result as? Data {
                return String(data: passwordData, encoding: .utf8) == password // check if passwords do match
            } else {
                return false // result unexpected
            }
        case errSecItemNotFound:
            return false // no password store yet
        default:
            return false // something went wrong
        }
    }
    
    func delete() {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: PasswordStore.account]
        
        let status = SecItemDelete(query as CFDictionary)
        switch status {
        case errSecSuccess:
            print("Password deleted")
        default:
            print("Error deleting password \(status.description)")
        }
    }
}
