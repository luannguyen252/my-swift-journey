//
//  TitleView.swift
//  FundTransferApp2
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct TitleView: View {
    // MARK: - BODY
    var body: some View {
        VStack {
            Text("Tap to Pay")
                .font(.system(size: 22, weight: .bold, design: .rounded))
            Text("One click to fund transfer")
                .font(.system(size: 12, design: .rounded))
        } //: VSTACK
        .foregroundColor(.white)
    }
}
