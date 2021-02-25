//
//  AccountSummaryViewModel.swift
//  BankApp
//
//  Created by Mohammad Azam on 8/9/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

class AccountSummaryViewModel {
    
    private var _accounts = [Account]()
    
    var accounts = [AccountViewModel]()
    
    var total: Double {
        _accounts.map { $0.balance }.reduce(0, +)
    }
    
    func setAccounts(_ accounts: [Account]) {
        _accounts = accounts
        self.accounts = _accounts.map(AccountViewModel.init)
    }
    
}
