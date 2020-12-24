//
//  TransactionListHeader.swift
//  BankingApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct TransactionListHeader: View {
    // MARK: - PROPERTIES
    let title: String
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Text(title)
                .font(.caption)
                .foregroundColor(ColorConstants.secondary)
                .padding(.leading, 20)
            Spacer()
        } //: HSTACK
    }
}
