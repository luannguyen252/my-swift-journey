//
//  DescriptionView.swift
//  FundTransferApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct DescriptionView: View {
    // MARK: - BODY
    var body: some View {
        HStack {
            HStack {
                Text("🇺🇸")
                    .font(.system(size: 60))
                    .fixedSize()
                    .frame(width: 30, height: 30)
                    .cornerRadius(15)
                Text("USD")
                    .font(.system(size: 20))
            } //: HSTACK
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.white)
            .cornerRadius(30)
            
            TextField("Say something", text: .constant(""))
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                .background(Color.white)
                .cornerRadius(30)
        } //: HSTACK
        .padding(.horizontal)
    }
}
