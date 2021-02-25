//
//  TransferAccountFund.swift
//  BankApp
//
//  Created by Mohammad Azam on 8/14/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation


struct TransferFundRequest: Codable {
    
    let accountFromId: String
    let accountToId: String
    let amount: Double 
    
}
