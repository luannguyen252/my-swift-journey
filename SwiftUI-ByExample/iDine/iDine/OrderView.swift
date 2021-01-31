//
//  OrderView.swift
//  iDine
//
//  Created by Luan Nguyen on 01/01/2021.
//

import SwiftUI

struct OrderView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var order: Order
    
    // MARK: - BODY
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
                    .onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Place Order")
                    }
                }
                .disabled(order.items.isEmpty)
            } //: LIST
            .navigationBarTitle("Order")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton().opacity(order.items.isEmpty ? 0 : 1))
        } //: NAVIGATION VIEW
    }
    
    // MARK: - DELETE ITEMS
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct OrderView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        OrderView()
            .environmentObject(order)
    }
}
#endif
