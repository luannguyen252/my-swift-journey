//
//  ExchangeRateList.swift
//  CurrencyConverter
//
//  Created by Vincent Smithers on 13.06.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import SwiftUI

struct ExchangeRateList : View {
    
    @ObservedObject var viewModel: ExchangeRateViewModel
    
    var body: some View {
        List(viewModel.exchangeRates) { rate in
            ExchangeRateRow(exchangeRate: rate) }
            .navigationBarTitle(Text("Exchange Rate \(viewModel.baseCurrencyCode)"), displayMode: .large)
            .onAppear {
                self.viewModel.requestExchangeRates()
        }
    }
}
