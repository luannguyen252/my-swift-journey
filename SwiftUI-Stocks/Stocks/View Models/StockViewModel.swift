//
//  StockViewModel.swift
//  Stocks
//
//  Created by Juan Francisco Dorado Torres on 25/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation

struct StockViewModel {
  private let stock: Stock

  var symbol: String {
    return stock.symbol.uppercased()
  }

  var description: String {
    return stock.description
  }

  var price: String {
    return String(format: "%.2f", stock.price)
  }

  var change: String {
    return stock.change
  }

  init(_ stock: Stock) {
    self.stock = stock
  }
}
