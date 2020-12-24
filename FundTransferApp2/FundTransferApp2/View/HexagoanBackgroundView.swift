//
//  HexagoanBackgroundView.swift
//  FundTransferApp2
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct HexagoanBackgroundView: View {
    // MARK: - BODY
    var body: some View {
        ZStack {
            RoundedHexagoan()
                .fill(Color.purpleGradient)
                .shadow(color: Color.black.opacity(0.3), radius: 30, x: 40, y: 40)
            
            RoundedHexagoan()
                .fill(Color.purpleGradient)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 30, y: 30)
                .scaleEffect(0.65)
        } //: ZSTACK
        .frame(width: 280, height: 320)
    }
}
