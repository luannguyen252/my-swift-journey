//
//  UserView.swift
//  FundTransferApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct UserView: View {
    // MARK: - PROPERTIES
    let user: User
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 60, height: 60)
            
            Image(user.imageName)
        } //: ZSTACK
        .offset(x: user.id < 3 ? 85 : 150)
        .rotationEffect(.degrees(Double(user.id * 100)))
    }
}
