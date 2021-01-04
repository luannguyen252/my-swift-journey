//
//  Home.swift
//  MVVMApp3
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct Home: View {
    // MARK: - PROPERTIES
    @ObservedObject var users = FetchAccounts()
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            if self.users.accounts.isEmpty {
                Indicator()
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        ForEach(self.users.accounts) { user in
                            CardView(accountDetails: user)
                        }
                    } //: VSTACK
                } //: SCROLLVIEW
            }
        } //: ZSTACK
        .onAppear {
            self.users.fetchUsers()
        }
        .navigationTitle("Home")
    }
}

// MARK: - PREVIEW
#if DEBUG
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
#endif
