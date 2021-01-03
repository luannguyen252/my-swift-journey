//
//  AppConstants.swift
//  SwiftUIBankCardAnimation
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

// MARK: - APP CONSTANTS
struct AppConstants {
    static var cards = [
        Card(id: 0, cardNumber: "123 4567 8910 1112", cardHolderName: "Nguyen Thanh Luan", security: "123", balance: "1234", validity: "01/12", cardPalatte: palattes[0], cardType: .debit),
        Card(id: 2, cardNumber: "1314 1516 1718 1920", cardHolderName: "Nguyen Thanh Luan", security: "456", balance: "5678", validity: "02/12", cardPalatte: palattes[1], cardType: .debit),
        Card(id: 3, cardNumber: "2122 2324 2526 2728", cardHolderName: "Nguyen Thanh Luan", security: "789", balance: "1112", validity: "03/12", cardPalatte: palattes[2], cardType: .credit),
    ]
    
    static var palattes: [CardPalatte] = [
        CardPalatte(colorOne: Color(0xfbc2eb), colorTwo: Color(0xa6c1ee)),
        CardPalatte(colorOne: Color(0x43cea2), colorTwo: Color(0x185a9d)),
        CardPalatte(colorOne: Color(0xfa709a), colorTwo: Color(0xfee140))
    ]
}
