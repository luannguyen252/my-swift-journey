//
//  TransactionListView.swift
//  Banking
//
//  Created by Anik on 1/8/20.
//

import SwiftUI

struct TransactionListView: View {
    @Binding var currentIndex: Int
    @ObservedObject var cardManager: CardManager
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(getListHeaders(), id: \.self) { date in
                    ListHeader(title: cardManager.getModifiedDate(date: date))
                    ForEach(getTransactions(date: date), id: \.self) { transaction in
                        TransactionListRow(transaction: transaction, isLast: cardManager.lastTransactionID == transaction.id)
                    }
                }
            }
        }
    }
    
    func getTransactions(date: String) -> [TransactionItem] {
        return cardManager.getTransaction(for: date, number: cards[currentIndex].number)
    }
    
    func getListHeaders() -> [String] {
        return cardManager.getUniqueDates(for: cards[currentIndex].number)
    }
}

struct ListHeader: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.caption)
                .foregroundColor(ColorConstants.secondary)
                .padding(.leading, 20)
            Spacer()
        }
    }
}

struct TransactionListRow: View {
    let transaction: TransactionItem
    let isLast: Bool
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ZStack {
                    Circle()
                        .fill(ColorConstants.border)
                        .frame(width: 50, height: 50)
                    Image(systemName: "applelogo")
                        .foregroundColor(ColorConstants.secondary)
                }
                
                VStack(alignment: .leading) {
                    Text(transaction.service)
                        .foregroundColor(.white)
                    Text(transaction.type)
                        .font(.caption)
                        .foregroundColor(ColorConstants.secondary)
                }
                .padding(.leading, 10)
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("- \(String(format: "%.2f", transaction.amount)) USD")
                        .foregroundColor(.white)
                    Text(transaction.time)
                        .font(.caption)
                        .foregroundColor(ColorConstants.secondary)
                }
            }
            
            
            Divider()
                .background(ColorConstants.secondary)
                .opacity(isLast ? 0.0 : 1.0)
                .padding(.leading, 60)
                .padding(.bottom, 8)
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}
