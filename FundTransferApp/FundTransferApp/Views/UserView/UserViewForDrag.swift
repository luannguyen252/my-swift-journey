//
//  UserViewForDrag.swift
//  FundTransferApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct UserViewForDrag: View {
    // MARK: - PROPERTIES
    let user: User
    var width: CGFloat = 60
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: width, height: width)
            
            Image(user.imageName)
                .resizable()
                .frame(width: width - 10, height: width - 10)
        } //: ZSTACK
    }
}
