//
//  CurrencyRate.swift
//  CurrencyConverter
//
//  Created by Vincent Smithers on 11.06.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import Foundation
import SwiftUI

struct ExchangeRate {
    let currency: Currency
    let baseCurrency: Currency
    let rate: Decimal
    var formattedRate: String {
        return NumberFormatter.formatCurrency(value: rate, forLocale: currency.locale)
    }
}

extension ExchangeRate: Identifiable {
    var id: String {
        return NSUUID().uuidString
    }
}

