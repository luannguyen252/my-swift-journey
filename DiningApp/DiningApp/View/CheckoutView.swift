//
//  CheckoutView.swift
//  DiningApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct CheckoutView: View {
    static let paymentTypes = ["Cash", "Credit Card", "Gift Points"]
    static let tipAmounts = [10,15,20,25,0]
    @State private var tipamount = 1
    @State private var addLoyaltyDetails = false
    @State private var loyalityNumber = ""
    @State private var paymentType = 0
    @State private var showPaymentAlert = false

    @EnvironmentObject var order: Order

    var totalPrice: Double {
        let total = Double(order.total)
        let tipVAlue = total / 100 * Double(Self.tipAmounts[tipamount])
        return total + tipVAlue
    }

    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count){
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $addLoyaltyDetails) {
                    Text("Add loyality card")
                }
                
                if addLoyaltyDetails {
                    TextField("Enter your layalty number", text: $loyalityNumber.animation())
                }
            }
            
            Section(header: Text("Add a tip ?")){
                Picker("Percentage", selection: $tipamount){
                    ForEach(0 ..< Self.tipAmounts.count){
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(
              header:Text("TOTAL $\(totalPrice, specifier: "%.2f")")
                .font(.subheadline)
             ){
                Button("Confirm order"){
                    self.showPaymentAlert = true
                }
                .alert(isPresented: $showPaymentAlert){
                    Alert(title: Text("Order Confirmed"), message:Text("Your payment of $\(totalPrice, specifier: "%.2f") is sucessfull") )
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
