//
//  SearchUserView.swift
//  DynamicList-SwiftUI-Combine
//
//  Created by Farooq Rasheed on 04/01/2020.
//  Copyright © 2020 Ryo Aoyama. All rights reserved.
//

import SwiftUI

struct SearchUserView: View {
    @ObservedObject var viewModel = SearchUserViewModel()
    
    var body: some View {
        VStack {
            SearchUserBar(text: $viewModel.name) {
                self.viewModel.search()
            }
            
            List(viewModel.users) { user in
                SearchUserRow(viewModel: self.viewModel, user: user)
                    .onAppear { self.viewModel.fetchImage(for: user) }
            }.listRowBackground(Color.white)
        }
    }
}
