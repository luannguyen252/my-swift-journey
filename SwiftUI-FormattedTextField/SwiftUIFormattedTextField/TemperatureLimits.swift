//
//  TemperatureLimits.swift
//  SwiftUIFormattedTextField
//
//  Created by Toomas Vahter on 18.04.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import Foundation

struct TemperatureLimits {
    var low: Int = 5 {
        didSet {
            print(low)
            let high = max(self.high, low + 10)
            guard self.high != high else { return }
            self.high = high
        }
    }
    var high: Int = 30 {
        didSet {
            print(high)
            let low = min(self.low, high - 10)
            guard self.low != low else { return }
            self.low = low
        }
    }
    
    var lowNumber: NSNumber {
        get { NSNumber(value: low) }
        set { low = newValue.intValue }
    }
    
    var highNumber: NSNumber {
        get { NSNumber(value: high) }
        set { high = newValue.intValue }
    }
}
