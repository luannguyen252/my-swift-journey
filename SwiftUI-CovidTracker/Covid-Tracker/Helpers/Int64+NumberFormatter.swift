//
//  Int64+NumberFormatter.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 13.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import Foundation

extension Int64 {
    
    var formattedNumber: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumIntegerDigits = 1
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
