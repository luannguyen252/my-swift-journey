//
//  ContentView.swift
//  CupCakes
//
//  Created by Sandesh on 05/07/20.
//  Copyright © 2020 devsandesh. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.detail.type) {
                        ForEach(0 ..< Order.types.count, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper(value: $order.detail.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.detail.quantity)")
                    }
                }
                
                Section {
                    Toggle(isOn: $order.detail.specialRequestEnabled.animation()) {
                        Text("Any Special Requests")
                    }
                    
                    if order.detail.specialRequestEnabled {
                        Toggle(isOn: $order.detail.extraFrosting) {
                            Text("Add extra frosting")
                        }

                        Toggle(isOn: $order.detail.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Delivery Address")
                    }
                }
            }
            .navigationBarTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
