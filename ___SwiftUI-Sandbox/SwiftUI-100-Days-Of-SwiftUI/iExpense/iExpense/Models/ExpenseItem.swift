//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Nicholas Fox on 1/3/20.
//  Copyright © 2020 Nicholas Fox. All rights reserved.
//

import Foundation

struct ExpenseItem: Codable, Identifiable {
  let name: String
  let type: String
  let amount: Int
  let id = UUID()
}


extension ExpenseItem {
  static let mock = ExpenseItem(name: "Test", type: "Personal", amount: 42)
}
