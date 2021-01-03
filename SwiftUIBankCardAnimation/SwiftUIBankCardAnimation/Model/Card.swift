//
//  Card.swift
//  SwiftUIBankCardAnimation
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

// MARK: - CARD MODEL
struct Card: Identifiable, Hashable {
    enum CardType: String {
        case credit = "Credit"
        case debit = "Debit"
    }
    
    let id: Int
    let cardNumber: String
    let cardHolderName: String
    let security: String
    
    let balance: String
    let validity: String
    var cardPalatte: CardPalatte
    let cardType: CardType
    
    mutating func changePalatte(palatte: CardPalatte) {
        self.cardPalatte = palatte
    }
}

// MARK: - CARD PALATTE
struct CardPalatte: Hashable {
    let colorOne: Color
    let colorTwo: Color
}
