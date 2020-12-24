//
//  TopNavView.swift
//  FundTransferApp2
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct TopNavView: View {
    // MARK: - BODY
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(Color.white)
                    .offset(x: 10)
                Circle()
                    .fill(Color.white)
                Circle()
                    .fill(Color.white)
                    .offset(y: 10)
            } //: ZSTACK
            .frame(width: 5, height: 5)
            .padding(20)
            
            Spacer()
            
            ZStack {
                Image(systemName: "ellipsis.bubble")
                    .foregroundColor(.white)
                Circle()
                    .fill(Color.orangeColor)
                    .frame(width: 8, height: 8)
                    .offset(x: 7, y: -7)
            } //: ZSTACK
            .padding(20)
        } //: HSTACK
    }
}
