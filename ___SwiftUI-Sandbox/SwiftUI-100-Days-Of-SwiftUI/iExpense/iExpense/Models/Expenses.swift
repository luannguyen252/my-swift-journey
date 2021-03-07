//
//  Expenses.swift
//  iExpense
//
//  Created by Nicholas Fox on 1/3/20.
//  Copyright © 2020 Nicholas Fox. All rights reserved.
//

import Foundation

class Expenses: ObservableObject {

  @Published var items: [ExpenseItem] {
    didSet {
      let encoder = JSONEncoder()
      guard let encodedItems = try? encoder.encode(items) else { return }
      UserDefaults.standard.set(encodedItems, forKey: "Items")
    }
  }

  init() {
    let decoder = JSONDecoder()
    if
      let saved = UserDefaults.standard.data(forKey: "Items"),
      let restoredItems = try? decoder.decode([ExpenseItem].self, from: saved)
    {
      items = restoredItems
    } else {
      items = []
    }
  }
}
