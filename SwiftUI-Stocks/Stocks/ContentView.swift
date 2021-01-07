//
//  ContentView.swift
//  Stocks
//
//  Created by Juan Francisco Dorado Torres on 25/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject private var stockListVM = StockListViewModel()

  init() {
    UINavigationBar.appearance().backgroundColor = .black
    UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    UITableView.appearance().backgroundColor = .black
    UITableViewCell.appearance().backgroundColor = .black

    stockListVM.load()
  }

  var body: some View {
    let filteredStocks = self.stockListVM.searchTerm.isEmpty ?
      self.stockListVM.stocks :
      self.stockListVM.stocks.filter { $0.symbol.starts(with: self.stockListVM.searchTerm) }

    return NavigationView {
      ZStack(alignment: .leading) {
        Color.black
        Text("January 5 2020")
          .font(.custom("Arial", size: 32))
          .fontWeight(.bold)
          .foregroundColor(Color.gray)
          .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
          .offset(y: -400)

        SearchView(searchTerm: self.$stockListVM.searchTerm)
          .offset(y: -350)

        StockListView(stocks: filteredStocks)
          .offset(y: 150)

        ArticlesView(
          articles: self.stockListVM.articles,
          onDragBegin: { value in
            self.stockListVM.dragOffset = value.translation
          }, onDragEnd: { value in
            if value.translation.height < 0 {
              self.stockListVM.dragOffset = CGSize(width: 0, height: 100)
            } else {
              self.stockListVM.dragOffset = CGSize(width: 0, height: 700)
            }
          }
        )
          .animation(.spring())
          .offset(y: self.stockListVM.dragOffset.height)
      }
      .navigationBarTitle("Stocks")
    }
    .edgesIgnoringSafeArea(Edge.Set(.bottom))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
