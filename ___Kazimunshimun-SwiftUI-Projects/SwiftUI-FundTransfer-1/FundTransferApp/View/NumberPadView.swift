//
//  NumberPadView.swift
//  FundTransferApp
//
//  Created by Anik on 24/9/20.
//

import SwiftUI

struct NumberPadView: View {
    let numbers = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["0", "", "."]
    ]
    @ObservedObject var input:  PaymentInput
    var body: some View {
        VStack {
            ForEach(numbers, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { number in
                        Button(action: {
                            input.handleNumbers(number: number)
                        }, label: {
                            Text(number)
                                .padding(12)
                                .fixedSize()
                                .frame(width: 70)
                                .foregroundColor(.black)
                        })
                    }
                }
            }
        }
        .font(.system(size: 28, weight: .bold))
        .padding(.leading, 8)
    }
}
