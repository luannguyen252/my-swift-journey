//
//  PaymentActionView.swift
//  FundTransferApp
//
//  Created by Anik on 24/9/20.
//

import SwiftUI

struct PaymentActionView: View {
    @ObservedObject var input:  PaymentInput
    @Binding var config: PaymentViewConfig
    
    var body: some View {
        VStack {
            Button(action: {
                input.handleBackspace()
            }, label: {
                Image(systemName: "delete.left")
                    .font(.system(size: 24))
                    .padding(16)
                    .fixedSize()
                    .frame(width: 70)
            })
            
            
            Button(action: {
                withAnimation(.linear(duration: 0.7)) {
                    config.showCreditCard = true
                }
            }, label: {
                ZStack {
                    Rectangle()
                        .fill()
                        .frame(height: 200)
                    Text("SEND")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                }
            })
            
        }
        .foregroundColor(.black)
    }
}
