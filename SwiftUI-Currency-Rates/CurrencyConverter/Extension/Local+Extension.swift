//
//  Local+Extension.swift
//  CurrencyConverter
//
//  Created by Vincent Smithers on 17.06.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import Foundation

extension Locale {
    init(prefix: String, code: String) {
        let id = code.dropLast()
        self = Locale(identifier: "\(prefix)_\(id)")
    }
}
