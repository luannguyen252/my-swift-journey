//
//  CardBalance.swift
//  SwiftUIBankCardMotion
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct CardBalance: View {
    @Binding var isCardTapped: Bool
    var cardData: CardStructure
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Current Balance")
                .foregroundColor(.secondary)
                .opacity(isCardTapped ? 0 : 1)
            
            HStack(alignment: .top, spacing: 2) {
                Text("\(cardData.cardAmount)")
                    .foregroundColor(.primary)
                    .font(.system(size: 40))
                    .fontWeight(.heavy)
                    
                Text("đ")
                    .foregroundColor(.primary)
                    .font(.system(size: 18))
            }
            
            Text("Transactions")
                .foregroundColor(.secondary)
                .font(.system(size: 18))
                .opacity(isCardTapped ? 1 : 0)
                .transition(.slide)
        }
        .padding(.vertical, 80)
        .offset(y: isCardTapped ? -140 : 0)
        .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0))
    }
}
