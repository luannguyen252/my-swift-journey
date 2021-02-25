
import SwiftUI

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
                .opacity(self.transferFundsVM.fromAccount != nil ? 1.0 : 0.5)
                .disabled(self.transferFundsVM.fromAccount == nil)
            
            TextField("Amount", text: self.$transferFundsVM.amount)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
        }.padding()
    }
}
