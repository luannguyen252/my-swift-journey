//
//  PaymentView.swift
//  ParkingApp
//
//  Created by Anik on 2/12/20.
//

import SwiftUI

struct PaymentView: View {
    @Binding var selectedHour: CGFloat
    let perHourFee: CGFloat
    var body: some View {
        HStack {
            Text("$\(String.init(format: "%.2f", selectedHour/2 * perHourFee))")
                .font(.system(size: 22, weight: .bold))
            Spacer()
            Button(action: {
                
            }, label: {
                Text("Pay")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 180, height: 60)
                    .background(Color.yellowColor)
                    .cornerRadius(20)
            })
        }
    }
}
