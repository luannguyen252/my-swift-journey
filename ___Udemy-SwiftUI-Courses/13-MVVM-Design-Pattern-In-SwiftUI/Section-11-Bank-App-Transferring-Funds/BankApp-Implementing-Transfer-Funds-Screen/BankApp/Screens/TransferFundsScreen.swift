//
//  TransferFundsScreen.swift
//  BankApp
//
//  Created by Mohammad Azam on 8/15/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct TransferFundsScreen: View {
    
    @ObservedObject private var transferFundsVM = TransferFundsViewModel()
    @State private var showSheet = false
    @State private var isFromAccount = false
    
    var actionSheetButtons: [Alert.Button] {
        
        var actionButtons = self.transferFundsVM.accounts.map { account in
            Alert.Button.default(Text("\(account.name) (\(account.accountType))")) {
                if self.isFromAccount {
                    self.transferFundsVM.fromAccount = account
                } else {
                    self.transferFundsVM.toAccount = account
                }
            }
        }
        
        actionButtons.append(.cancel())
        return actionButtons
    }
    
    var body: some View {
        VStack {
            AccountListView(accounts: self.transferFundsVM.accounts)
                .frame(height: 300)
            
            TransferFundsAccountSelectionView(transferFundsVM: self.transferFundsVM, showSheet: $showSheet, isFromAccount: $isFromAccount)
                Spacer()
                .onAppear {
                    self.transferFundsVM.populateAccounts()
            }
            
                .actionSheet(isPresented: $showSheet) {
                    ActionSheet(title: Text("Transfer Funds"), message: Text("Choose an account"), buttons: self.actionSheetButtons)
            }
            
            }.navigationBarTitle("Transfer Funds").embedInNavigationView()
    }
}

struct TransferFundsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TransferFundsScreen()
    }
}

struct TransferFundsAccountSelectionView: View {
    
    @ObservedObject var transferFundsVM: TransferFundsViewModel
    @Binding var showSheet: Bool
    @Binding var isFromAccount: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            Button("From \(self.transferFundsVM.fromAccountType)") {
                self.isFromAccount = true
                self.showSheet = true
            }.padding().frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(Color.white)
            
            Button("To \(self.transferFundsVM.toAccountType)") {
                self.isFromAccount = false
                self.showSheet = true
            }.padding().frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(Color.white)
        }.padding()
    }
}
