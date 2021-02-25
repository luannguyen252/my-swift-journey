//
//  AccountListView.swift
//  BankApp
//
//  Created by Mohammad Azam on 8/9/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct AccountListView: View {
    
    let accounts: [AccountViewModel]
    
    var body: some View {
        List(accounts, id: \.accountId) { account in
            HStack {
                VStack(alignment: .leading,spacing: 10) {
                    Text(account.name)
                        .font(.headline)
                    
                    Text(account.accountType)
                        .opacity(0.5)
                }
                Spacer()
                Text("\(account.balance.formatAsCurrency())")
                    .foregroundColor(Color.green)
            }
        }
    }
}

struct AccountListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let accountVM = AccountViewModel(account: Account(id: UUID(), name: "John Doe", accountType: .checking, balance: 100))
        
        return AccountListView(accounts: [accountVM])
    }
}
