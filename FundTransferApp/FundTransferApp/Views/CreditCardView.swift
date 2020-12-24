//
//  CreditCardView.swift
//  FundTransferApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct CreditCardView: View {
    // MARK: - PROPERTIES
    @Binding var showCreditCard: Bool
    
    // MARK: - BODY
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
                } //: HSTACK
                
                HStack(alignment: .firstTextBaseline) {
                    Image(systemName: "simcard.fill")
                        .font(.system(size: 40))
                        .rotationEffect(.degrees(90))
                    
                    Spacer()
                    
                    Text("9456 8944 9456 8944")
                        .bold()
                } //: HSTACK
                
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
                } //: HSTACK
            }
            .padding(.horizontal)
            .foregroundColor(.white)
        } //: ZSTACK
        .frame(width: 300, height: showCreditCard ? 170 : 0.0)
        .opacity(showCreditCard ? 1.0 : 0.0)
    }
}
