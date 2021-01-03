//
//  DownloadHelper.swift
//  StockX
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

let apiKey = "UNHT8S40KCTQ0AOH"

func generateRequestURL(stockSymbol: String) -> String {
    return "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=\(stockSymbol)&interval=15min&outputsize=full&apikey=\(apiKey)"
}
