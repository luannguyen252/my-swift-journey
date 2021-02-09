//
//  RandomSettingsViewModel.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 8/31/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation

// MARK:- Random Settings View Model
final class RandomSettingsViewModel: ObservableObject {
    @Published var lowercase: Characters = .init(set: .lowercase, isIncluded: true)
    @Published var uppercase: Characters = .init(set: .uppercase, isIncluded: true)
    @Published var digits: Characters = .init(set: .digits, isIncluded: true)
    @Published var symbols: Characters = .init(set: .symbols, isIncluded: true)
    @Published var ambiguous: Characters = .init(set: .ambiguous, isIncluded: false)
    var allTypes: [Characters] { [lowercase, uppercase, digits, symbols, ambiguous] }
    
    @Published var readability: Readability = .defaultCase
    
    @Published var additionalSettings: Set<AdditionalSetting> = [.startsWithLetter]
    
    @Published var separator: Separator = .init()
}

// MARK:- Sync
extension RandomSettingsViewModel {
    func syncFirstChar() {
        if !lowercase.isIncluded && !uppercase.isIncluded {
            additionalSettings.remove(.startsWithLetter)
        }
    }
    
    func syncWeights() {
        readability = .custom
    }
    
    func syncReadability() {
        lowercase.weight = lowercase.set.standardWeight(readability: readability)
        uppercase.weight = uppercase.set.standardWeight(readability: readability)
        digits.weight = digits.set.standardWeight(readability: readability)
        symbols.weight = symbols.set.standardWeight(readability: readability)
        ambiguous.weight = ambiguous.set.standardWeight(readability: readability)
    }
    
    func setAndSyncAdditionalSettings(_ setting: AdditionalSetting, to isOn: Bool) {
        if
            !additionalSettings.contains(.startsWithLetter) &&
            setting == .startsWithLetter &&
            isOn &&
            (!lowercase.isIncluded && !uppercase.isIncluded)
        {
            lowercase.isIncluded = true
            uppercase.isIncluded = true
        }

        switch isOn {
        case false: additionalSettings.remove(setting)
        case true: additionalSettings.insert(setting)
        }
    }
}
