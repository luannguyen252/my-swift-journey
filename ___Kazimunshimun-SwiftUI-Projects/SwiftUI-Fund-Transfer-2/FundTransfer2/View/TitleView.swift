//
//  TitleView.swift
//  FundTransfer2
//
//  Created by Anik on 29/9/20.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack {
            Text("Tap to Pay")
                .font(.system(size: 22, weight: .bold, design: .rounded))
            Text("One click to fund transfer")
                .font(.system(size: 12, design: .rounded))
        }
        .foregroundColor(.white)
    }
}
