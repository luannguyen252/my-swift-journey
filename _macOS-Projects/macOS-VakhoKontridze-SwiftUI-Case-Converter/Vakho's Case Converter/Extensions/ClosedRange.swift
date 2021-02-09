//
//  ClosedRange.swift
//  Vakho's Case Converter
//
//  Created by Vakhtang Kontridze on 9/1/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation

extension ClosedRange where Bound == Int {
    var asDouble: ClosedRange<Double> {
        Double(lowerBound)...Double(upperBound)
    }
}
