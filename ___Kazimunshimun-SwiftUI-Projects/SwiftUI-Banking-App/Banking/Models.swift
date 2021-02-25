//
//  Models.swift
//  Banking
//
//  Created by Anik on 1/8/20.
//

import Foundation

enum CardType: String {
    case Silver
    case Gold
    case Platinum
}

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

struct Expence: Identifiable {
    let id = UUID()
    let month: String
    let amount: Float
    
    var selected: Bool = false
}
