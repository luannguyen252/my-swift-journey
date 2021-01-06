//
//  ConverterViewModel.swift
//  UnitCoverter WatchKit Extension
//
//  Created by Alfian Losari on 14/09/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import SwiftUI

class ConverterViewModel: ObservableObject {
    
    @Published var fromValue: Double = 0
    @Published var toValue: Double = 0
    
    @Published var unit = MainUnit.area {
        didSet {
            unitChanged()
        }
    }
    
    @Published var fromUnit: Dimension = UnitArea.squareMeters {
        didSet {
            calculateUnitDimensionValue()
        }
    }
    
    @Published var toUnit: Dimension = UnitArea.squareCentimeters {
        didSet {
            calculateUnitDimensionValue()
        }
    }
    
    func unitChanged() {
        fromUnit = unit.units[0]
        toUnit = unit.units[1]
        fromValue = 1.0
        calculateUnitDimensionValue()
    }
    
    func calculateUnitDimensionValue() {
        let measurement = Measurement(value: fromValue, unit: fromUnit)
        toValue = measurement.converted(to: toUnit).value
    }
}
