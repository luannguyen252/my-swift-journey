//
//  AppState.swift
//  BankApp
//
//  Created by Mohammad Azam on 8/9/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

class AppState: ObservableObject {
    
    @Published var accounts = [Account]()
    
    init() {
        populateAllAccounts()
    }
    
    private func populateAllAccounts() {
        
        AccountService.shared.getAllAccounts { result in
            switch result {
            case .success(let accounts):
                if let accounts = accounts {
                    DispatchQueue.main.async {
                        self.accounts = accounts
                    }
                    
                    
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
    }
    
    func update() {
        populateAllAccounts()
    }
    
}
