//
//  DescriptionView.swift
//  FundTransferApp
//
//  Created by Anik on 24/9/20.
//

import SwiftUI

struct DescriptionView: View {
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
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.white)
            .cornerRadius(30)
            
            TextField("Say something", text: .constant(""))
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                .background(Color.white)
                .cornerRadius(30)
        }
        .padding(.horizontal)
    }
}
