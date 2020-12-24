//
//  Models.swift
//  BankingApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

// MARK: - CARD TYPE MODEL
enum CardType: String {
    case Silver
    case Gold
    case Platinum
}

// MARK: - CARD MODEL
struct Card: Identifiable {
    var id = UUID()
    let number: String
    let type: CardType
    let company: String
    var selected: Bool = false
    
    func getLastForDigit() -> String {
        return String(number.suffix(4))
    }
}

// MARK: - TRANSACTION ITEM MODEL
struct TransactionItem: Identifiable, Hashable {
    let id = UUID()
    let date: String
    let time: String
    let company: String
    let service: String
    let card: String
    let amount: Float
    let type: String
}

// MARK: - EXPENCE MODEL
struct Expence: Identifiable {
    let id = UUID()
    let month: String
    let amount: Float
    
    var selected: Bool = false
}
