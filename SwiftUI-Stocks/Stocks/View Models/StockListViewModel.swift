//
//  StockListViewModel.swift
//  Stocks
//
//  Created by Juan Francisco Dorado Torres on 25/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation
import SwiftUI

class StockListViewModel: ObservableObject {
  @Published var dragOffset = CGSize(width: 0, height: 700)
  @Published var searchTerm = ""
  @Published var stocks = [StockViewModel]()
  @Published var articles = [ArticleViewModel]()

  func load() {
    fetchStocks()
    fetchNews()
  }

  private func fetchNews() {
    StockService.getTopNews { result in
      switch result {
      case .success(let articles):
        DispatchQueue.main.async {
          self.articles = articles.map(ArticleViewModel.init)
        }
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }

  private func fetchStocks() {
    StockService.getStocks { (result) in
      switch result {
      case .success(let stocks):
        DispatchQueue.main.async {
          self.stocks = stocks.map(StockViewModel.init)
        }
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}
