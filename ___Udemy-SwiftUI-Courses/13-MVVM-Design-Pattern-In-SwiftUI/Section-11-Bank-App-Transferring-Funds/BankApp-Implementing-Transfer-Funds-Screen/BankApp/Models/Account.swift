//
//  Account.swift
//  BankApp
//
//  Created by Mohammad Azam on 8/10/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

enum AccountType: String, Codable, CaseIterable {
    case checking
    case saving
}

extension AccountType {
    
    var title: String {
        switch self {
        case .checking:
            return "Checking"
        case .saving:
            return "Saving"
        }
    }
    
}

struct Account: Codable {
    
    var id: UUID
    var name: String
    let accountType: AccountType
    var balance: Double
}
