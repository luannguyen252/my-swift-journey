//
//  OrderSheet.swift
//  SwiftUICoreData
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct OrderSheet: View {
    // MARK: - PROPERTIES
    let pizzaTypes = ["Pizza Margherita", "Greek Pizza", "Pizza Supreme", "Pizza California", "New York Pizza"]
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @State var selectedPizzaIndex = 1
    @State var numberOfSlices = 1
    @State var tableNumber = ""
    
    // MARK: - BODY
    var body: some View {
        // MARK: - ORDER VIEW
        NavigationView {
            // MARK: - ORDER FORM
            Form {
                // MARK: - ORDER DETAILS
                Section(header: Text("Pizza Details")) {
                    // MARK: - CHOOSE TYPE
                    Picker(selection: $selectedPizzaIndex, label: Text("Pizza Type")) {
                        ForEach(0 ..< pizzaTypes.count) {
                                Text(self.pizzaTypes[$0]).tag($0)
                        }
                    }
                    
                    // MARK: - CHOOSE SLICE
                    Stepper("\(numberOfSlices) Slices", value: $numberOfSlices, in: 1...12)
                }
                
                // MARK: - ORDER INPUT
                Section(header: Text("Table")) {
                    TextField("Table Number", text: $tableNumber)
                        .keyboardType(.numberPad)
                    
                }
                
                // MARK: - ORDER BUTTON
                Button(action: {
                    guard self.tableNumber != "" else { return }
                    let newOrder = Order(context: viewContext)
                    newOrder.pizzaType = self.pizzaTypes[self.selectedPizzaIndex]
                    newOrder.orderStatus = .pending
                    newOrder.tableNumber = self.tableNumber
                    newOrder.numberOfSlices = Int16(self.numberOfSlices)
                    newOrder.id = UUID()
                    
                    do {
                        try viewContext.save()
                        print("Order saved.")
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                }) {
                    Text("Add Order")
                }
            }
            
            // MARK: - ORDER SHEET TITLE
            .navigationTitle("Add Order")
        }
    }
}

// MARK: - PREVIEW
struct OrderSheet_Previews: PreviewProvider {
    static var previews: some View {
        OrderSheet()
    }
}
