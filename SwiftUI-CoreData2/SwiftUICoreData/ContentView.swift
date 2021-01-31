//
//  ContentView.swift
//  SwiftUICoreData
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    //: SHOW ORDER SHEET
    @State var showOrderSheet = false
    //: SAVED ORDERS
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Order.entity(), sortDescriptors: [], predicate: NSPredicate(format: "status != %@", Status.completed.rawValue))
    var orders: FetchedResults<Order>
    
    // MARK: - BODY
    var body: some View {
        // MARK: - NAVIGATION VIEW
        NavigationView {
            // MARK: - LIST
            List {
                //: DISPLAY THE FETCHED DATA
                ForEach(orders) { order in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(order.pizzaType) - \(order.numberOfSlices) slices")
                                .font(.headline)
                            Text("Table \(order.tableNumber)")
                                .font(.subheadline)
                        } //: VSTACK
                        Spacer()
                        Button(action: { updateOrder(order: order) }) {
                            Text(order.orderStatus == .pending ? "Prepare" : "Complete")
                                .foregroundColor(.blue)
                        }
                    } //: HSTACK
                    .frame(height: 50)
                }
                // MARK: - DELETE ORDERS FROM THE PERSISTEN STORAGE
                //: USE DRAG GESTURE SWIPE LEFT TO DELETE
                .onDelete { indexSet in
                    for index in indexSet {
                        viewContext.delete(orders[index])
                    }
                    do {
                        try viewContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            .listStyle(PlainListStyle())
            
            // MARK: - NAVIGATION TITLE
            .navigationTitle("My Orders")
            
            // MARK: - NAVIGATION ACTION
            .navigationBarItems(trailing: Button(action: {
                showOrderSheet = true
            }, label: {
                Image(systemName: "plus.circle")
                    .imageScale(.large)
            }))
            
            // MARK: - OPEN ORDER SHEET
            .sheet(isPresented: $showOrderSheet) {
                OrderSheet()
            }
        }
    }
    
    // MARK: - UPDATE CORE DATA ENTRIES
    func updateOrder(order: Order) {
        let newStatus = order.orderStatus == .pending ? Status.preparing : .completed
        viewContext.performAndWait {
            order.orderStatus = newStatus
            try? viewContext.save()
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
