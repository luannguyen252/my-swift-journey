//
//  UserView.swift
//  FundTransferApp2
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
                .fill(Color.background)
                .frame(width: 50, height: 50)
            Image(user.imageName)
                .resizable()
                .frame(width: 40, height: 40)
            
            ZStack {
                Circle()
                    .fill(Color.background)
                    .frame(width: 25, height: 25)
                Circle()
                    .fill(Color.orangeColor)
                    .frame(width: 20, height: 20)
                Image(systemName: "checkmark")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.white)
            } //: ZSTACK
            .offset(x: 15, y: 15)
            .opacity(user.selected ? 1.0 : 0.0)
        } //: ZSTACK
    }
}
