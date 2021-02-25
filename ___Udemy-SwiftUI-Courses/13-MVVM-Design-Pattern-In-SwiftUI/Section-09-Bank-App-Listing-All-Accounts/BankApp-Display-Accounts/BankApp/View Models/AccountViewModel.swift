//
//  AccountViewModel.swift
//  BankApp
//
//  Created by Mohammad Azam on 8/9/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

class AccountViewModel {
    
    var account: Account
    
    init(account: Account) {
        self.account = account
    }
    
    var name: String {
        account.name
    }
    
    var accountId: String {
        account.id.uuidString
    }
    
    var accountType: String {
        account.accountType.title
    }
    
    var balance: Double {
        account.balance
    }
    
}
