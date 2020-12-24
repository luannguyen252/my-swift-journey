//
//  PaymentInput.swift
//  FundTransferApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

class PaymentInput: ObservableObject {
    @Published var amount = ""
    
    // MARK: - HANDLE NUMBERS
    func handleNumbers(number: String) {
        // Restrict digit count to 7
        if amount.count < 7 {
            if number != "." {
                amount.append(number)
            } else {
                // Check if . already in the string
                if !amount.contains(".") {
                    amount.append(number)
                }
            }
        }
    }
    
    // MARK: - HANDLE BACKSPACE
    func handleBackspace() {
        if amount.count > 0 {
            amount.removeLast()
        }
    }
}
