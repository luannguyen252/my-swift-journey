//
//  RefreshView.swift
//  FundTransferApp2
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct RefreshView: View {
    // MARK: - PROPERTIES
    @Binding var isRefreshing: Bool
    
    // MARK: - BODY
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
        } //: ZSTACK
    }
}
