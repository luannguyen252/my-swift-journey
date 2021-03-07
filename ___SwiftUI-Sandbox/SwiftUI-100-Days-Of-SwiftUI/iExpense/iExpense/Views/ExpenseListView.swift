//
//  ContentView.swift
//  iExpense
//
//  Created by Nicholas Fox on 1/3/20.
//  Copyright © 2020 Nicholas Fox. All rights reserved.
//

import SwiftUI


struct ExpenseListView: View {

  @ObservedObject var expenses = Expenses()

  @State private var isShowingAddExpense = false

  var body: some View {
    NavigationView {
      List {
        ForEach(expenses.items) {
          ExpenseView(expense: $0)
        }
        .onDelete(perform: removeItem)
      }
      .navigationBarTitle("iExpense")
      .navigationBarItems(leading:
        Button(action: {
          self.expenses.items = []
        }) {
          Text("Clear All")
        }
      )

      .navigationBarItems(trailing:
        HStack {
          EditButton()
          Button(action: {
            self.isShowingAddExpense = true
          }) {
            Image(systemName: "plus")
          }
        }
      )
      .sheet(isPresented: $isShowingAddExpense) {
        AddExpenseView(expenses: self.expenses)
      }
    }
  }

  func removeItem(at offsets: IndexSet) {
    expenses.items.remove(atOffsets: offsets)
  }
}

struct ExpenseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseListView()
    }
}
