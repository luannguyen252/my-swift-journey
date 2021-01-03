//
//  TestData.swift
//  SwiftUIBankCardAnimation2
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

// Card Data
enum TestData {
    static let cards = [
        Card(balance: 123,
         cardNumber: "1234 5678 9101 1213",
         cardHolderName: "Nguyen Thanh Luan",
         serviceLogo: #imageLiteral(resourceName: "mc_logo"),
         color: UIColor(named: "cardColor1")!),
        
    Card(balance: 456,
         cardNumber: "1415 1617 1819 2021",
         cardHolderName: "Nguyen Thanh Luan",
         serviceLogo: #imageLiteral(resourceName: "mc_logo"),
         color: UIColor(named: "cardColor2")!),
    
    Card(balance: 789,
         cardNumber: "2223 2425 2527 2829",
         cardHolderName: "Nguyen Thanh Luan",
         serviceLogo: #imageLiteral(resourceName: "mc_logo"),
         color: UIColor(named: "cardColor3")!),
    
    Card(balance: 1011,
         cardNumber: "3031 3233 3435 3637",
         cardHolderName: "Nguyen Thanh Luan",
         serviceLogo: #imageLiteral(resourceName: "mc_logo"),
         color: UIColor(named: "cardColor4")!)
    ]
}
