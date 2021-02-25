//
//  AccountSummaryScreen.swift
//  BankApp
//
//  Created by Mohammad Azam on 8/9/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct AccountSummaryScreen: View {
    
    @EnvironmentObject var appState: AppState
    var accountSummaryVM: AccountSummaryViewModel = AccountSummaryViewModel()
    
    var body: some View {
        
        self.accountSummaryVM.setAccounts(self.appState.accounts)
        
        return Group {
            if !appState.accounts.isEmpty {
                VStack {
                    AccountListView(accounts: self.accountSummaryVM.accounts)
                    AccountTotalView(total: self.accountSummaryVM.total)
                }
            } else {
                EmptyView()
            }
        }
       
    }
}

struct AccountSummaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        let appState = AppState()
        return AccountSummaryScreen().environmentObject(appState)
    }
}
