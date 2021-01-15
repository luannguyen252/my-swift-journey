//
//  Cheese.swift
//  SwiftUIDemoSmazak
//
//  Created by Marek Přidal on 03/09/2019.
//  Copyright © 2019 Marek Přidal. All rights reserved.
//

import Foundation

struct Cheese {
    enum `Type` {
        case standard
        case ermine
    }

    let currencyCode: String
    let date: Date
    let price: Double
    let type: Type
    let weight: Double
}
