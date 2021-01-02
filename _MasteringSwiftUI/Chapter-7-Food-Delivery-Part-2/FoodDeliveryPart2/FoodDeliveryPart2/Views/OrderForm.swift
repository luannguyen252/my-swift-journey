//
//  OrderForm.swift
//  FoodDeliveryPart2
//
//  Created by Luan Nguyen on 02/01/2021.
//

import SwiftUI

struct OrderForm: View {
    // MARK: - PROPERTIES
    // Special Request
    @State var specialRequest = false
    @State var specialRequestInput = ""
    
    // Order Amount
    @State var orderAmount = 1
    
    // Details
    @State var firstName = ""
    @State var lastName = ""
    @State var street = ""
    @State var city = ""
    @State var zip = ""
    
    // Feedback
    @State var userFeedback = 0.0
    
    // Order Sheet
    @Binding var showOrderSheet: Bool
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            Form {
                // 1.
                Section {
                    // MARK: - SPECIAL REQUESTS
                    Toggle(isOn: $specialRequest.animation()) {
                        Text("Any special requests?")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color("AccentColor")))
                    
                    if specialRequest {
                        TextField("Enter your request", text: $specialRequestInput.animation())
                    }
                    
                    // MARK: - QUANTITY
                    Stepper(value: $orderAmount, in: 1...10) {
                        Text("Quantity: \(orderAmount)")
                    }
                }
                
                // 2.
                Section {
                    // MARK: - DETAILS
                    TextField("First name", text: $firstName)
                    TextField("Last name", text: $lastName)
                    TextField("Street", text: $street)
                    TextField("City", text: $city)
                    TextField("ZIP code", text: $zip)
                }
                
                // 3.
                Section {
                    VStack {
                        Text("How do you like our Food Delivery App?")
                            .padding(.top, 10)
                        
                        HStack {
                            Image(systemName: "hand.thumbsdown")
                            Slider(value: $userFeedback, in: 0.0...10.0)
                                .accentColor(Color("AccentColor"))
                            Image(systemName: "hand.thumbsup")
                        }
                    }
                }
                
                // 4.
                Section {
                    Button(action: {
                        print("Order placed.")
                    }, label: {
                        Text("Place Order")
                    })
                }
            } //: FORM
            .navigationTitle("Your Order")
            .navigationBarItems(leading: Button(action: {
                showOrderSheet = false
            }, label: {
                Text("Cancel")
            }))
        }
    }
}

// MARK: - PREVIEW
#if DEBUG
struct OrderForm_Previews: PreviewProvider {
    static var previews: some View {
        OrderForm(showOrderSheet: .constant(false))
    }
}
#endif
