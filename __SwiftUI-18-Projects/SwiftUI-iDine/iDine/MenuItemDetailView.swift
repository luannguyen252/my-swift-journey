//
//  MenuItemDetailView.swift
//  iDine
//
//  Created by Sandesh on 10/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

struct MenuItemDetailView: View {
    var item: MenuItem
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack(spacing: 20) {
                ZStack(alignment: .bottomTrailing) {
                    Image(self.item.mainImage)
                    Text(item.photoCredit)
                        .padding(8)
                        .background(Color.black.opacity(0.7))
                        .foregroundColor(.white)
                }
                
                Text(item.description)
                    .padding(.bottom)
            
            Text("Price: \(item.price)")
                .fontWeight(.bold)
                .font(.title)
                
                Button("Order") {
                    self.order.add(item: self.item)
                }
                .padding()
                .frame(width: 100, height: 44)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                Spacer()
                
            }
            .navigationBarTitle(Text(self.item.name), displayMode: .inline)
    }
}

struct MenuItemDetailView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        NavigationView {
            MenuItemDetailView(item: MenuItem.example)
            .environmentObject(order)
        }
    }
}
