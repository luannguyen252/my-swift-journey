//
//  TransactionListRow.swift
//  BankingApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct TransactionListRow: View {
    // MARK: - PROPERTIES
    let transaction: TransactionItem
    let isLast: Bool
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ZStack {
                    Circle()
                        .fill(ColorConstants.border)
                        .frame(width: 50, height: 50)
                    Image(systemName: "applelogo")
                        .foregroundColor(ColorConstants.secondary)
                } //: ZSTACK
                
                VStack(alignment: .leading) {
                    Text(transaction.service)
                        .foregroundColor(.white)
                    Text(transaction.type)
                        .font(.caption)
                        .foregroundColor(ColorConstants.secondary)
                } //: VSTACK
                .padding(.leading, 10)
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("- \(String(format: "%.2f", transaction.amount)) USD")
                        .foregroundColor(.white)
                    Text(transaction.time)
                        .font(.caption)
                        .foregroundColor(ColorConstants.secondary)
                } //: VSTACK
            } //: HSTACK
            
            Divider()
                .background(ColorConstants.secondary)
                .opacity(isLast ? 0.0 : 1.0)
                .padding(.leading, 60)
                .padding(.bottom, 8)
        } //: VSTACK
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}
