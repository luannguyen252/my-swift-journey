//
//  PaymentHistory.swift
//  SwiftUIBankCardMotion
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct PaymentHistory: View {
    @Environment(\.colorScheme) var colorScheme
    
    init() {
        UITableView.appearance().backgroundColor = .clear // TableView Background
        UITableViewCell.appearance().backgroundColor = .clear // Cell Background
    }
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(historyData) { payment in
                    PaymentHistoryDetail(paymentDetail: payment)
                }
            }
            .padding(24)
        }
        .frame(height: 400)
        .frame(maxWidth: 375)
        .background(colorScheme == .dark ? Color("bgPaymenHistory") : Color.white)
        .cornerRadius(24)
        .shadow(color: colorScheme == .dark ? Color.white.opacity(0.05) : Color.black.opacity(0.1), radius: 16, x: 0, y: 4)
    }
}

#if DEBUG
struct PaymentHistory_Previews: PreviewProvider {
    static var previews: some View {
        PaymentHistory()
    }
}
#endif
