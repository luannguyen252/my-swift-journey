//
//  HexagoanBackgroundView.swift
//  FundTransfer2
//
//  Created by Anik on 29/9/20.
//

import SwiftUI

struct HexagoanBackgroundView: View {
    var body: some View {
        ZStack {
            RoundedHexagoan()
                .fill(Color.purpleGradient)
                .shadow(color: Color.black.opacity(0.3), radius: 30, x: 40, y: 40)
            
            RoundedHexagoan()
                .fill(Color.purpleGradient)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 30, y: 30)
                .scaleEffect(0.65)
        }
        .frame(width: 280, height: 320)
    }
}
