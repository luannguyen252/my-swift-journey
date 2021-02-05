//
//  SearchUserRow.swift
//  DynamicList-SwiftUI-Combine
//
//  Created by Farooq Rasheed on 04/01/2020.
//  Copyright © 2020 Farooq Rasheed. All rights reserved.
//

import SwiftUI

struct SearchUserRow: View {
    @ObservedObject var viewModel: SearchUserViewModel
    @State var user: User
    
    var body: some View {
        HStack {
            viewModel.userImages[user].map { image in
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.purple, lineWidth: 2))
            }
            VStack {
                Text(user.login)
                    .font(Font.system(size: 18).bold())
            }
            
        }
        .frame(height: 70)
    }
}
