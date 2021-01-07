//
//  AddView.swift
//  iExpense
//
//  Created by Juan Francisco Dorado Torres on 27/11/20.
//

import SwiftUI

struct AddView: View {
  @ObservedObject var expenses: Expenses
  @Environment(\.presentationMode) var presentationMode

  @State private var name = ""
  @State private var type = "Personal"
  @State private var amount = ""
  @State private var isShowingAlert = false

  static let types = ["Business", "Personal"]

  var body: some View {
    NavigationView {
      Form {
        TextField("Name", text: $name)
        Picker("Type", selection: $type) {
          ForEach(Self.types, id: \.self) { Text($0)
          }
        }
        TextField("Amount", text: $amount)
          .keyboardType(.numberPad)
      }
      .navigationBarTitle("Add new expense")
      .navigationBarItems(
        trailing: Button("Save") {
          if let actualAmount = Int(self.amount) {
            let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
            self.expenses.items.append(item)
            self.presentationMode.wrappedValue.dismiss()
          } else {
            amount = ""
            isShowingAlert.toggle()
          }
        }
      )
      .alert(isPresented: $isShowingAlert) {
        Alert(
          title: Text("Hey watch out! 👀"),
          message: Text("That wasn't a number."),
          dismissButton: .default(Text("I'll check thanks!")))
      }
    }
  }
}

struct AddView_Previews: PreviewProvider {
  static var previews: some View {
    AddView(expenses: Expenses())
  }
}
