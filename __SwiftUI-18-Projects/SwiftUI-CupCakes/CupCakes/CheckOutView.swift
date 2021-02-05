//
//  CheckOutView.swift
//  CupCakes
//
//  Created by Sandesh on 06/07/20.
//  Copyright © 2020 devsandesh. All rights reserved.
//

import SwiftUI

struct CheckOutView: View {
    @ObservedObject var order: Order
    @State private var confirmationMessage = ""
    @State private var showingConfimation = false
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    
                    Text("Your total is $\(self.order.cost, specifier: "%.2f")")
                        .font(.title)
                    
                    Button("Place Order") {
                        self.placeOrder()
                    }
                    .padding()
                }
            }
        }.navigationBarTitle("Check Out")
            .alert(isPresented: $showingConfimation) { () -> Alert in
                Alert(title: Text("Thank You"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    func placeOrder()  {
        guard  let encodedOrder =  try? JSONEncoder().encode(order) else {
            print("Failed to encode Order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/JSON", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encodedOrder
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            //Challenge 2
            if  error != nil {
                self.confirmationMessage = error!.localizedDescription
                self.showingConfimation = true
                return
            }
            
            guard let data = data else {
                print("No data recieved: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.confirmationMessage = "Your order for \(decodedOrder.detail.quantity) x \(Order.types[decodedOrder.detail.type].lowercased()) cupcakes is on its way!!"
                self.showingConfimation = true
            } else {
                print("Invalid response from server")
            }
        }.resume()
        
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckOutView(order: Order())
        }
    }
}
