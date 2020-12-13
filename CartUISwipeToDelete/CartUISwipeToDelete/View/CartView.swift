//
//  CartView.swift
//  CartUISwipeToDelete
//
//  Created by Luan Nguyen on 13/12/2020.
//

import SwiftUI

struct CartView: View {
    // MARK: - PROPERTIES
    @StateObject var cartData = CartViewModel()
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundColor(Color("text"))
                }
                Text("My Cart")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("text"))
                Spacer()
            }
            .padding()
            // MARK: - CART ITEMS
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(cartData.items) { item in
                        ItemView(item: $cartData.items[getIndex(item: item)],items: $cartData.items)
                    }
                } //: LAZYVSTACK
            } //: SCROLLVIEW
            
            //: MARK - TOTAL PRICE AND CHECK OUT BUTTON
            VStack {
                HStack {
                    Text("Total")
                        .fontWeight(.heavy)
                        .foregroundColor(Color("text").opacity(0.6))
                    Spacer()
                    // MARK: - CALCULATING TOTAL PRICE
                    Text(calculateTotalPrice())
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("text"))
                } //: HSTACK
                .padding([.top,.horizontal])
                // MARK: - CHECK OUT BUTTON
                Button(action: {}) {
                    Text("Check out")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(
                            LinearGradient(gradient: .init(colors: [Color("lightBlue"),Color("darkBlue")]), startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(15)
                }
            } //: VSTACK
            .background(Color("bg2"))
            .shadow(color: Color("text").opacity(0.10), radius: 16, x: 0, y: -8)
        } //: VSTACK
        .background(Color("bg2").ignoresSafeArea())
    }
    
    // MARK: - GET INDEX CART ITEMS
    func getIndex(item: Item) -> Int {
        return cartData.items.firstIndex { (item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
    
    // MARK: - CALCULATE TOTAL PRICE
    func calculateTotalPrice() -> String {
        var price : Float = 0
        cartData.items.forEach { (item) in
            price += Float(item.quantity) * item.price
        }
        return getPrice(value: price)
    }
}
