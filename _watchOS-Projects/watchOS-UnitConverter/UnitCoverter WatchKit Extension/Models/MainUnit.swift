//
//  MainUnit.swift
//  UnitCoverter WatchKit Extension
//
//  Created by Alfian Losari on 14/09/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import Foundation

enum MainUnit: String, CustomStringConvertible, CaseIterable, Identifiable {
    
    var id: String {
        self.rawValue
    }
    
    case area
    case weight
    case speed
    case power
    case energy
    case length
    case angle
    case temperature
    case duration
    case storage
    
    var description: String {
        switch self {
        case .area: return "Area"
        case .weight: return "Weight"
        case .speed: return "Speed"
        case .power: return "Power"
        case .energy: return "Energy"
        case .length: return "Length"
        case .angle: return "Angle"
        case .temperature: return "Temperature"
        case .duration: return "Duration"
        case .storage: return "Storage"
        }
    }
    
    var units: [Dimension] {
        switch self {
        case .area: return [UnitArea.squareMeters, UnitArea.squareKilometers, UnitArea.squareCentimeters, UnitArea.hectares, UnitArea.squareFeet, UnitArea.squareInches, UnitArea.squareMiles]
        case .weight: return [UnitMass.kilograms, UnitMass.grams, UnitMass.milligrams, UnitMass.ounces, UnitMass.pounds]
        case .speed: return [UnitSpeed.kilometersPerHour, UnitSpeed.milesPerHour, UnitSpeed.metersPerSecond]
        case .power: return [UnitPower.kilowatts, UnitPower.megawatts, UnitPower.milliwatts]
        case .energy: return [UnitEnergy.calories, UnitEnergy.joules, UnitEnergy.kilowattHours]
        case .length: return [UnitLength.centimeters, UnitLength.feet, UnitLength.inches, UnitLength.kilometers, UnitLength.meters, UnitLength.miles, UnitLength.yards, UnitLength.parsecs]
        case .angle: return [UnitAngle.degrees, UnitAngle.radians, UnitAngle.gradians]
        case .temperature: return [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin]
        case .duration: return [UnitDuration.hours, UnitDuration.minutes, UnitDuration.seconds, UnitDuration.milliseconds, UnitDuration.nanoseconds, UnitDuration.picoseconds]
        case .storage: return [UnitInformationStorage.bits, UnitInformationStorage.bytes, UnitInformationStorage.gigabits, UnitInformationStorage.gigabytes, UnitInformationStorage.kilobits, UnitInformationStorage.kilobytes, UnitInformationStorage.megabits, UnitInformationStorage.megabytes, UnitInformationStorage.petabits, UnitInformationStorage.petabytes, UnitInformationStorage.terabits, UnitInformationStorage.terabytes]
        }
    }
}
