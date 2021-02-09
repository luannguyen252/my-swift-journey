//
//  SettingsViewModel.swift
//  Vakho's Case Converter
//
//  Created by Vakhtang Kontridze on 9/13/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation

// MARK:- Settings View Model
final class SettingsViewModel: ObservableObject {
    @Published var title: String = ""
    
    @Published var conversionCase: ConversionCase = .title
    
    @Published var principalWords: WordGroup = .init(ticked: true, length: 4, range: 1...10)
    
    @Published var specialWords: WordGroup = .init(ticked: true, length: 3, range: 1...21)
    @Published var specialWordsPool: Set<SpecialWord> = SpecialWord.defaultValue
    
    @Published var capitalizeDelimetered: Bool = true
    
    @Published var useCustomWords: Bool = true
}

// MARK:- Convert
extension SettingsViewModel {
    func convert() {
        title = {
            switch conversionCase {
            case .lower: return CaseConverter.toLowercase(title)
            case .upper: return CaseConverter.toUppercase(title)
            case .title: return CaseConverter.toTitleCase(title, settings: asTitleCaseSettings)
            case .sentence: return CaseConverter.toSentenceCase(title)
            case .capital: return CaseConverter.toCapitalCase(title)
            case .alternate: return CaseConverter.toAlternateCase(title)
            case .toggle: return CaseConverter.toToggleCase(title)
            }
        }()
    }
}

// MARK:- Title Case Settings
extension SettingsViewModel {
    var asTitleCaseSettings: TitleCaseSettings {
        .init(
            principalWords: principalWords,
            specialWords: specialWords,
            specialWordsPool: specialWordsPool,
            capitalizeDelimetered: capitalizeDelimetered,
            useCustomWords: useCustomWords
        )
    }
    struct TitleCaseSettings {
        var principalWords: WordGroup

        var specialWords: WordGroup
        var specialWordsPool: Set<SpecialWord>

        var capitalizeDelimetered: Bool
        
        var useCustomWords: Bool
    }
}

// MARK:- Sync
extension SettingsViewModel {
    func syncSpecialWord() {
        switch specialWords.ticked {
        case false: specialWordsPool = []
        case true: specialWordsPool = SpecialWord.defaultValue
        }
    }
    
    func syncSpecialWords() {
        switch specialWordsPool.isEmpty {
        case false: specialWords.ticked = true
        case true: specialWords.ticked = false
        }
    }
}
