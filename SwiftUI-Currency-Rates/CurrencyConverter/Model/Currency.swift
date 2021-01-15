//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Vincent Smithers on 11.06.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import Foundation
import SwiftUI

struct Currency {
    
    let locale: Locale
    let code: String
    let title: String
    let symbol: String
    let image: Image
    
    init(currencyCode: String) {
        locale = Locale(prefix: "en", code: currencyCode)
        code = currencyCode
        symbol = locale.currencySymbol ?? ""
        title = locale.localizedString(forCurrencyCode: code) ?? ""
        image = Image(code)
    }
}

extension Currency: Identifiable {
    var id: String {
        return NSUUID().uuidString
    }
}

