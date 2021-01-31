//
//  CheckoutView.swift
//  iDine
//
//  Created by Luan Nguyen on 01/01/2021.
//

import SwiftUI

struct CheckoutView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var order: Order
    
    // Payment Types
    static let paymentTypes = ["Cash", "Credit Card", "Gift Points"]
    @State private var paymentType = 0
    
    // Tip Amounts
    static let tipAmounts = [10, 15, 20, 25, 0]
    @State private var tipamount = 1
    
    // Loyalty Details
    @State private var addLoyaltyDetails = false
    @State private var loyalityNumber = ""
    
    // Payment Alert
    @State private var showPaymentAlert = false
    
    // Pickup Times
    static let pickupTimes = ["Morning", "Afternoon", "Evening"]
    @State private var pickupTime = 0

    // MARK: - TOTAL PRICE
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipamount])
        return total + tipValue
    }

    // MARK: - BODY
    var body: some View {
        Form {
            Section {
                // Payment Types
                Picker("How do you want to pay", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                // Loyalty Details
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Add loyality card")
                }
                
                if addLoyaltyDetails {
                    TextField("Enter your layalty number", text: $loyalityNumber.animation())
                }
            }
            
            // Tips
            Section(header: Text("Add a tip?")){
                Picker("Percentage", selection: $tipamount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            // Pickup Time
            Section(header: Text("Pickup time")){
                Picker("Choose time", selection: $pickupTime) {
                    ForEach(0 ..< Self.pickupTimes.count) {
                        Text("\(Self.pickupTimes[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            // Total Price
            Section(
              header:Text("TOTAL $\(totalPrice, specifier: "%.2f")")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.black)
             ){
                Button("Confirm order") {
                    self.showPaymentAlert = true // = self.showPaymentAlert.toggle()
                }
                .alert(isPresented: $showPaymentAlert){
                    Alert(title: Text("Order Confirmed"), message:Text("Your payment of $\(totalPrice, specifier: "%.2f") is sucessfull"), dismissButton: .default(Text("OK")))
                }
            }
        } //: FORM
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        CheckoutView()
            .environmentObject(order)
    }
}
#endif
