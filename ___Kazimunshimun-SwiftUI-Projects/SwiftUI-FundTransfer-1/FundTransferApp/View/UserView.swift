//
//  UserView.swift
//  FundTransferApp
//
//  Created by Anik on 24/9/20.
//

import SwiftUI

struct UserView: View {
    let user: User
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 60, height: 60)
            
            Image(user.imageName)
        }
        .offset(x: user.id < 3 ? 85 : 150)
        .rotationEffect(.degrees(Double(user.id * 100)))
    }
}

struct UserViewForDrag: View {
    let user: User
    var width: CGFloat = 60
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: width, height: width)
            
            Image(user.imageName)
                .resizable()
                .frame(width: width - 10, height: width - 10)
        }
    }
}
