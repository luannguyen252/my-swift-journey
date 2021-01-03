//
//  StockList.swift
//  StockX
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct StockList: View {
    var body: some View {
        NavigationView {
            List {
                StockListRow(stockSymbol: "AAPL", stockName: "Apple, Inc.", downloadManager: DownloadManager(stockSymbol: "AAPL"))
                StockListRow(stockSymbol: "NFLX", stockName: "Netflix, Inc.", downloadManager: DownloadManager(stockSymbol: "NFLX"))
                StockListRow(stockSymbol: "GOOG", stockName: "Alphabet Inc.", downloadManager: DownloadManager(stockSymbol: "GOOG"))
                StockListRow(stockSymbol: "TSLA", stockName: "Tesla, Inc.", downloadManager: DownloadManager(stockSymbol: "TSLA"))
                StockListRow(stockSymbol: "AMZN", stockName: "Amazon.com, Inc.", downloadManager: DownloadManager(stockSymbol: "AMZN"))
                StockListRow(stockSymbol: "ABNB", stockName: "Airbnb Inc", downloadManager: DownloadManager(stockSymbol: "ABNB"))
                StockListRow(stockSymbol: "WMT", stockName: "Walmart Inc", downloadManager: DownloadManager(stockSymbol: "WMT"))
                StockListRow(stockSymbol: "AAL", stockName: "American Airlines Group Inc", downloadManager: DownloadManager(stockSymbol: "AAL"))
                StockListRow(stockSymbol: "V", stockName: "Visa Inc", downloadManager: DownloadManager(stockSymbol: "V"))
                StockListRow(stockSymbol: "MA", stockName: "Mastercard Inc", downloadManager: DownloadManager(stockSymbol: "MA"))
            }
            .navigationTitle("StockX")
        }
    }
}

struct StockList_Previews: PreviewProvider {
    static var previews: some View {
        StockList()
    }
}

struct StockListRow: View {
    let stockSymbol: String
    let stockName: String
    @ObservedObject var downloadManager: DownloadManager
    
    var body: some View {
        HStack {
            NavigationLink(destination: ContentView(stockSymbol: stockSymbol, downloadManager: downloadManager)) {
                VStack(alignment: .leading) {
                    Text(stockSymbol)
                        .font(.custom("Avenir", size: 20))
                        .fontWeight(.medium)
                    
                    Text(stockName)
                        .font(.custom("Avenir", size: 16))
                }
                
                Spacer()
                
                if downloadManager.dataFetched {
                    VStack(alignment: .trailing) {
                        Text(String(format: "%.2f", getPercentageChange(stockData: downloadManager.dailyEntries)) + "%")
                            .font(.custom("Avenir", size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(getPercentageChange(stockData: downloadManager.dailyEntries) < 0 ? .red : .blue)
                        Text("$" + String(format: "%.2f", downloadManager.dailyEntries.last?.close ?? 0))
                            .font(.custom("Avenir", size: 26))
                    }
                }
            }
        }
    }
}
