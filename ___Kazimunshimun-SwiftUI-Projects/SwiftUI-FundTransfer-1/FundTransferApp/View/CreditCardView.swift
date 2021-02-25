//
//  CreditCardView.swift
//  FundTransferApp
//
//  Created by Anik on 24/9/20.
//

import SwiftUI

struct CreditCardView: View {
    @Binding var showCreditCard: Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.cardLinear)
                
            
            VStack(spacing: 16) {
                HStack {
                    Text("Credit Card")
                        .bold()
                    Spacer()
                    
                    Image(systemName: "wave.3.right")
                        .font(.system(size: 30))
                }
                
                HStack(alignment: .firstTextBaseline) {
                    Image(systemName: "simcard.fill")
                        .font(.system(size: 40))
                        .rotationEffect(.degrees(90))
                    
                    Spacer()
                    
                    Text("9456 8944 9456 8944")
                        .bold()
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Card Holder")
                        Text("Dimest")
                            .bold()
                    }
                    .font(.system(size: 12))
                    
                    Spacer()
                    
                    Text("VISA")
                        .italic()
                        .bold()
                        .font(.system(size: 30))
                }
            }
            .padding(.horizontal)
            .foregroundColor(.white)
        }
        .frame(width: 300, height: showCreditCard ? 170 : 0.0)
        .opacity(showCreditCard ? 1.0 : 0.0)
    }
}
