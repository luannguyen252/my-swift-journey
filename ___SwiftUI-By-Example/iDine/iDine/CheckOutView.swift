//
//  CheckOutView.swift
//  iDine
//
//  Created by Reinaldo Villanueva Javierre on 23/10/2019.
//  Copyright © 2019 Reinaldo Villanueva Javierre. All rights reserved.
//

import SwiftUI

struct CheckOutView: View {
    @EnvironmentObject var order: Order

    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    static let tipAmounts = [10, 15, 20, 25, 0]

    //@State is used for simple objects being refresed in the local view
    //Apple recomends this to be private
    //Read the discussion on @State
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmmount = 1
    @State private var showingPaymentAlert = false

    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmmount])
        return total + tipValue
    }

    var body: some View {
        Form { //With a VStack here i would have a picker
            Section {
                Picker("How do you want to pay?",
                       selection: $paymentType) {
                    ForEach(0..<Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
            }

            Toggle(isOn: $addLoyaltyDetails.animation()) {
                Text("Add iDine loyalty card")
            }

            if addLoyaltyDetails {
                TextField("Enter your iDine ID", text: $loyaltyNumber)
            }

            Section(header: Text("Add a tip?")) {
                Picker("Percantage:", selection: $tipAmmount) {
                    ForEach(0..<Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }

            Section(header:
                Text("Total: $\(totalPrice, specifier: "%.2f")")
                    .font(.largeTitle)
            ) {
                Button("Confirm Order") {
                    self.showingPaymentAlert.toggle()
                }
            }
        }
            .navigationBarTitle(Text("Payment"), displayMode: .inline)
            .alert(isPresented: $showingPaymentAlert) {
                Alert(title: Text("Order confirmed"),
                      message: Text("Your total was $\(totalPrice, specifier: "%.2f") - thank you!"),
                      dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckOutView().environmentObject(order)
    }
}
