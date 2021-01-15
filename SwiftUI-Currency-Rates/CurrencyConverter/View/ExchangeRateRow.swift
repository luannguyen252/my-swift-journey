//
//  ExchangeRateView.swift
//  CurrencyConverter
//
//  Created by Vincent Smithers on 13.06.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import SwiftUI

struct ExchangeRateRow: View {
    var exchangeRate: ExchangeRate
    var body: some View {
        VStack(alignment: .leading) {
            CircleImage(image: exchangeRate.currency.image, width: 100.0, height: 100.0)
            Text(exchangeRate.currency.title).font(.callout)
            Text("Exchange Rate: \(exchangeRate.formattedRate)")
        }
    }
}

