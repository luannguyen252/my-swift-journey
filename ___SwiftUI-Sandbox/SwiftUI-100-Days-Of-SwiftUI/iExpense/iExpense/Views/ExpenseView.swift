//
//  ExpenseView.swift
//  iExpense
//
//  Created by Nicholas Fox on 1/4/20.
//  Copyright © 2020 Nicholas Fox. All rights reserved.
//

import SwiftUI

struct ExpenseView: View {

  let expense: ExpenseItem

  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(expense.name)
        Text(expense.type)
      }
      Spacer()
      Text("$\(expense.amount)")
    }
    .foregroundColor(getColor(for: expense))
  }

  private func getColor(for expense: ExpenseItem) -> Color {
    switch expense.amount {
    case ..<10: return .green
    case 10..<100: return .yellow
    case 100...: return .red
    default: fatalError()
    }
  }
}

struct ExpenseView_Previews: PreviewProvider {
  static var previews: some View {
    ExpenseView(expense: .mock)
  }
}
