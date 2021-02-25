//
//  RefreshView.swift
//  FundTransfer2
//
//  Created by Anik on 29/9/20.
//

import SwiftUI

struct RefreshView: View {
    @Binding var isRefreshing: Bool
    var body: some View {
        ZStack {
            RoundedHexagoan()
                .fill(Color.orangeColor)
                .frame(width: 84, height: 96)
                .shadow(color: Color.black.opacity(0.5), radius: 20, x: 10, y: 10)
            
            Image(systemName: "arrow.triangle.2.circlepath")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.white)
                .rotationEffect(isRefreshing ? .degrees(360) : .zero)
        }
    }
}
