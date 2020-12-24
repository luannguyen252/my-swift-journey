//
//  TopBarView.swift
//  FundTransferApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct TopBarView: View {
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 20) {
            Circle()
                .frame(width: 50, height: 50)
            
            Spacer()
            
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 50, height: 50)
                Image(systemName: "bell")
            } //: ZSTACK
            
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 50, height: 50)
                Image(systemName: "ellipsis")
                    .rotationEffect(.degrees(90))
            } //: ZSTACK
        } //: HSTACK
    }
}
