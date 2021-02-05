//
//  OrderView.swift
//  iDine
//
//  Created by Sandesh on 10/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                .onDelete(perform: deleteItem)
                }
                
                if order.items.count > 0 {
                    Section {
                        NavigationLink(destination: CheckOutView()) {
                            Text("Place Order")
                        }
                    }
                }
            }
                
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Order "))
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteItem(at offSet: IndexSet) {
        order.items.remove(atOffsets: offSet)
    }
}

struct OrderView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
