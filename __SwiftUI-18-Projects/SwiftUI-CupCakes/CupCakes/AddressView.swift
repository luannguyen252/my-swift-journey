//
//  AddressView.swift
//  CupCakes
//
//  Created by Sandesh on 06/07/20.
//  Copyright © 2020 devsandesh. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.detail.name)
                TextField("Street Address", text: $order.detail.streetAddress)
                TextField("City", text: $order.detail.city)
                TextField("Zip", text: $order.detail.zip)
            }
            
            Section {
                NavigationLink(destination: CheckOutView(order: order)) {
                    Text("Check Out")
                }
                .disabled(order.hasValidAddress == false)
            }
        }
        .navigationBarTitle("Delivery Address", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
