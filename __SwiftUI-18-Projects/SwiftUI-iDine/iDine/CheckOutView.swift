//
//  CheckOutView.swift
//  iDine
//
//  Created by Sandesh on 10/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

struct CheckOutView: View {
    
    private let paymentTypes = ["Cash", "Credit Card", "iDine Coins"]
    private let tipAmounts = [10,15,20,25,0]
    @EnvironmentObject var order: Order
    
    @State private var paymentOption = 1
    @State private var name = ""
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showAlert = false
    
    var totalAmount: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var body: some View {
        Form {
            Section {
                Picker("Payment Option", selection: $paymentOption) {
                    ForEach(0 ..< self.paymentTypes.count) {
                        Text(self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Add iDine loyalty card")
                }
                
                if addLoyaltyDetails {
                    TextField("Loyalty Card Number", text: $loyaltyNumber)
                }
                
                Picker("Tip", selection: $tipAmount) {
                    ForEach(0 ..< self.tipAmounts.count) {
                        Text("\(self.tipAmounts[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            
            }
            
            Section(
                header: Text("Total $\(totalAmount, specifier: "%.2f")")
                    .font(.largeTitle)
            ) {
                HStack {
                    Spacer()
                    Button("Place Order") {
                        self.showAlert = true
                    }
                    Spacer()
                }
            }
        }
        .navigationBarTitle("CheckOut")
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Bon Apitite!!"), message: Text("Your order is placed successfully, You have paid \(totalAmount, specifier: "%.2f")"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        NavigationView {
            CheckOutView().environmentObject(order)
        }
    }
}
