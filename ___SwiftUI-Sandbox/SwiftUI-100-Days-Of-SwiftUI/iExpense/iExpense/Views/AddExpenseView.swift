//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Nicholas Fox on 1/3/20.
//  Copyright © 2020 Nicholas Fox. All rights reserved.
//

import SwiftUI


struct AddExpenseView: View {

  @Environment(\.presentationMode) var presentationMode

  @ObservedObject var expenses: Expenses

  @State private var name: String = ""
  @State private var type: String = "Personal"
  @State private var amount: String = ""

  @State private var isShowingError = false

  private static let expenseTypes = ["Personal", "Business"]

  var body: some View {
    NavigationView {
      Form {
        TextField("Name", text: $name)
        Picker("Type", selection: $type) {
          ForEach(Self.expenseTypes, id: \.self) {
            Text($0)
          }
        }
        TextField("Amount", text: $amount)
          .keyboardType(.numberPad)
      }
      .alert(isPresented: $isShowingError, content: makeErrorAlert)
      .navigationBarTitle("Add New Expense")
      .navigationBarItems(trailing:
        Button(action: {
          guard let realAmount = Int(self.amount) else {
            self.isShowingError = true
            return
          }
          let expense = ExpenseItem(
            name: self.name,
            type: self.type,
            amount: realAmount)
          self.expenses.items.append(expense)
          self.presentationMode.wrappedValue.dismiss()
        }) {
          Text("Save")
        }
      )
    }
  }

  private func makeErrorAlert() -> Alert {
    return Alert(
      title: Text("Amount is invalid"),
      message: Text("The amount you entered isn't an integer. Please enter an integer."),
      dismissButton: .default(Text("OK")))
  }
}

struct AddExpenseView_Previews: PreviewProvider {
  static var previews: some View {
    AddExpenseView(expenses: Expenses())
  }
}
