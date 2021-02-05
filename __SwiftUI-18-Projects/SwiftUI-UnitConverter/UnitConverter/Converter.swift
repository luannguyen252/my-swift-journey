//
//  Converter.swift
//  UnitConverter
//
//  Created by Sandesh on 07/03/20.
//  Copyright © 2020 Sandesh. All rights reserved.
//

import Foundation

struct Converter {
   
    static let TEMPERATURE_UNITS        = ["Celsius", "Fahrenheit", "Kelvin"]
    static let LENGHT_UNITS             = ["meters", "kilometers", "feet", "yards"]
    static let TIME_UNITS               = ["seconds", "minutes", "hours"]
    static let VOLUME_UNITS             = ["milliliters", "liters", "cups", "pints", "gallons"]
    
    
    static func convertTemperature(value: Double, input: UnitTemperature, output: UnitTemperature) -> Double {
        let temperature = Measurement(value: value, unit: input)
        return temperature.converted(to: output).value
    }
    
    static func convertLenght(value: Double, input: UnitLength, output: UnitLength) -> Double {
        let lenght = Measurement(value: value, unit: input)
        return lenght.converted(to: output).value
    }
    
    static func convertTime(value: Double, input: UnitDuration, output: UnitDuration) -> Double {
        let time = Measurement(value: value, unit: input)
        return time.converted(to: output).value
    }
    
    static func convertVolume(value: Double, input: UnitVolume, output: UnitVolume) -> Double {
        let volume = Measurement(value: value, unit: input)
        return volume.converted(to: output).value
    }
}
