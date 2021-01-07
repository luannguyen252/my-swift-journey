//
//  ContentView.swift
//  iExpense
//
//  Created by Juan Francisco Dorado Torres on 22/11/20.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
  var id = UUID()
  let name: String
  let type: String
  let amount: Int
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

            if item.amount < 10 {
              Text("$\(item.amount) 🤑")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.green)
            } else if item.amount > 100 {
              Text("$\(item.amount) 💸")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.red)
            } else {
              Text("$\(item.amount) 😕")
                .font(.title)
                .fontWeight(.bold)
            }
          }
        }
        .onDelete(perform: removeItems)
      }
      .navigationBarTitle("iExpense")
      .navigationBarItems(
        leading: EditButton(),
        trailing: Button(
          action: {
            self.showingAddExpense = true
          },
          label: {
            Image(systemName: "plus")
          }
        )
      )
      .sheet(isPresented: $showingAddExpense) {
        AddView(expenses: self.expenses)
      }
    }
  }

  func removeItems(at offsets: IndexSet) {
    expenses.items.remove(atOffsets: offsets)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
