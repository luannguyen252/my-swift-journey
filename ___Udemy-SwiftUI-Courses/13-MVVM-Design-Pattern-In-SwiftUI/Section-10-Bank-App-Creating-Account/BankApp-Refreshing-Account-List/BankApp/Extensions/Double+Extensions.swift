//
//  Double+Extensions.swift
//  BankApp
//
//  Created by Mohammad Azam on 8/3/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

extension Double {
    
    func formatAsCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let formattedCurrency = formatter.string(from: self as NSNumber)
        return formattedCurrency ?? ""
    }
    
}
