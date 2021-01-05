//
//  PasswordStore.swift
//  JournalingApp
//
//  Created by Philipp Baldauf on 15.03.20.
//  Copyright © 2020 Philipp Baldauf. All rights reserved.
//

import Foundation

class PasswordStore {
    
    private static let account = "com.example.journalingapp"
    
    func store(password: String) {
        let passwordData = password.data(using: .utf8)!
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: PasswordStore.account,
                                    kSecValueData as String: passwordData]
        let status = SecItemAdd(query as CFDictionary, nil)
        switch status {
        case errSecSuccess:
            print("Password securely stored.")
        default:
            print("Password could not be stored.")
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
                return String(data: passwordData, encoding: .utf8) == password
            }
            print("Password securely stored.")
        default:
            return false // something went wrong
        }
        return false
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
