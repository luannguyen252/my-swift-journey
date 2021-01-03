//
//  ViewHelper.swift
//  StockX
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

func getPercentageChange(stockData: [DataEntry]) -> Double {
    if let lastEntryClose = stockData.last?.close, let firstEntryClose = stockData.first?.close {
        return ((lastEntryClose-firstEntryClose)/lastEntryClose)*100
    } else {
        return 0
    }
}

func bullishBearishGradient(lastClose: Double, firstClose: Double) -> Gradient {
    if lastClose < firstClose {
        return Gradient(colors: [Color.red, Color.clear])
    } else {
        return Gradient(colors: [Color.green, Color.clear])
    }
}
