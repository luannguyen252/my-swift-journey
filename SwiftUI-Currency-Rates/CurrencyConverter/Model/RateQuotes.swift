//
//  RateQuotes.swift
//  CurrencyConverter
//
//  Created by Vincent Smithers on 14.06.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import Foundation

struct RateQuotes: Codable {
    var source: String
    var quotes: [String: Double]
    var exchangeRates: [ExchangeRate] {
        quotes.compactMap { (key, value) -> ExchangeRate? in
            let currencyKey = key.replacingOccurrences(of: source, with: "")
            guard currencyKey.count == 3 else { return nil }
            return ExchangeRate(currency: Currency(currencyCode: currencyKey),
                                baseCurrency: Currency(currencyCode: source), rate: Decimal(floatLiteral: value))
        }
    }
}
