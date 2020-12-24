//
//  CardInfoView.swift
//  BankingApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct CardInfoView: View {
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            ProgressView()
            
            HStack(alignment: .firstTextBaseline, spacing: 0) {
                Text("$")
                    .font(.system(size: 30, weight: Font.Weight.bold, design: Font.Design.rounded))
                    .foregroundColor(ColorConstants.secondary)
                Text("5600")
                    .font(.system(size: 40, weight: Font.Weight.bold, design: Font.Design.rounded))
                    .foregroundColor(.white)
                    .padding(.leading, 10)
                Text(".90")
                    .font(.system(size: 20, weight: Font.Weight.bold, design: Font.Design.rounded))
                    .foregroundColor(ColorConstants.secondary)
            } //: HSTACK
            
            HStack(alignment: .firstTextBaseline, spacing: 20) {
                VStack(alignment: .leading, spacing: 30) {
                    Image(systemName: "creditcard.fill")
                    Image(systemName: "banknote.fill")
                    Image(systemName: "dot.radiowaves.right")
                } //: VSTACK
                .foregroundColor(ColorConstants.secondary)
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("Bank card")
                    Text("Bank account")
                    Text("Pay")
                } //: VSTACK
                .foregroundColor(.white)
            } //: HSTACK
        } //: VSTACK
    }
}
