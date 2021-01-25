//
//  CoffeeModel.swift
//  Ratios_SwiftUI
//
//  Created by Tarokh on 7/24/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation

typealias grams = Double

class CoffeeModel {
    static func calculateRatio(grams: grams, ratio: grams) -> grams {
        return grams * Double(ratio)
    }
}
