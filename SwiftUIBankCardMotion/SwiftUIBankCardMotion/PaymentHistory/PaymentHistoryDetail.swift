//
//  PaymentHistoryDetail.swift
//  SwiftUIBankCardMotion
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct PaymentHistoryDetail: View {
    var paymentDetail: HistoryStructure
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.1) : Color.black.opacity(0.05))
                
                Image(paymentDetail.serviceProviderLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
            }
            .frame(width: 45, height: 45)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(paymentDetail.serviceName)
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    .bold()
                
                Text(paymentDetail.serviceDateCharged)
                    .font(.system(size: 14))
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    .opacity(0.25)
            }

            Spacer()
            
            HStack(alignment: .top, spacing: 0) {
                Text("-\(paymentDetail.serviceAmountCharged)")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                
                Text("đ")
                    .font(.system(size: 14))
                    .fontWeight(.regular)
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            }
        }
    }
}
