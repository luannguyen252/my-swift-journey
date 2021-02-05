//
//  ContentView.swift
//  iExpense
//
//  Created by Sandesh on 29/03/20.
//  Copyright © 2020 Sandesh. All rights reserved.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    var name: String
    var type: String
    var amount: Int
}

class Expenses: ObservableObject {
    @Published var items: [ExpenseItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}

struct ContentView: View {
    
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("$\(item.amount)")
                            .foregroundColor(self.getColorForAmount(amount: item.amount))
                            .fontWeight(.heavy)
                    }
                }
                .onDelete(perform: removeItem)
            }
            .navigationBarTitle(Text("iExpense"))
            .navigationBarItems(leading: EditButton())
            .navigationBarItems(trailing:
                HStack(spacing: 20) {
                    EditButton()
                    Button(action: {
                        self.showingAddExpense.toggle()
                    }) { Image(systemName: "plus") }
            } )
                
                .sheet(isPresented: $showingAddExpense) { AddView(expenses: self.expenses) }
            
        }
        
    }
    
    func getColorForAmount(amount: Int) -> Color {
        if amount <= 10 { return Color.green }
        else if amount <= 100 { return Color.orange }
        else { return Color.red }
    }
    func removeItem(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
