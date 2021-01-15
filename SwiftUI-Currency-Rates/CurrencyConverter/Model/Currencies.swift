//
//  Currencies.swift
//  CurrencyConverter
//
//  Created by Vincent Smithers on 12.06.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import Foundation

let localeIds = ["SEK", "DKK", "PLN", "EUR", "NOK", "HUF", "CZK", "USD", "SGD", "HKD"]
let currencies: [Currency] = localeIds.map({ return Currency(currencyCode: $0) })

