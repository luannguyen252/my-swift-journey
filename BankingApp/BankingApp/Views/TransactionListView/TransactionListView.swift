//
//  TransactionListView.swift
//  BankingApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct TransactionListView: View {
    // MARK: - PROPERTIES
    @Binding var currentIndex: Int
    @ObservedObject var cardManager: CardManager
    
    // MARK: - BODY
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(getListHeaders(), id: \.self) { date in
                    TransactionListHeader(title: cardManager.getModifiedDate(date: date))
                    ForEach(getTransactions(date: date), id: \.self) { transaction in
                        TransactionListRow(transaction: transaction, isLast: cardManager.lastTransactionID == transaction.id)
                    }
                }
            } //: LAZYVSTACK
        } //: SCROLLVIEW
    }
    
    // MARK: - GET TRANSACTIONS
    func getTransactions(date: String) -> [TransactionItem] {
        return cardManager.getTransaction(for: date, number: cards[currentIndex].number)
    }
    
    // MARK: - GET LIST HEADERS
    func getListHeaders() -> [String] {
        return cardManager.getUniqueDates(for: cards[currentIndex].number)
    }
}
