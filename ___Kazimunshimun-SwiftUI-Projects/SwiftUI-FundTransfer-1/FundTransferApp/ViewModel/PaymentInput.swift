//
//  PaymentInput.swift
//  FundTransferApp
//
//  Created by Anik on 24/9/20.
//

import SwiftUI

class PaymentInput: ObservableObject {
    @Published var amount = ""
    
    func handleNumbers(number: String) {
        //restrict digit count to 7
        if amount.count < 7 {
            if number != "." {
                amount.append(number)
            } else {
                //check if . already in the string
                if !amount.contains(".") {
                    amount.append(number)
                }
            }
        }
    }
    
    func handleBackspace() {
        if amount.count > 0 {
            amount.removeLast()
        }
    }
}
