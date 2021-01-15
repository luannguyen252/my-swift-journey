//
//  NSNumberFormatter+Extension.swift
//  CurrencyConverter
//
//  Created by Vincent Smithers on 12.06.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import Foundation

extension NumberFormatter {
    class func formatCurrency(value: Decimal, forLocale locale: Locale) -> String {
        let numFormater = NumberFormatter()
        numFormater.numberStyle = .currency
        numFormater.locale = locale
        guard let formattedString = numFormater.string(from: NSDecimalNumber(decimal: value)) else {
            fatalError("Cannot format currency rate")
        }
        return formattedString
    }
}
