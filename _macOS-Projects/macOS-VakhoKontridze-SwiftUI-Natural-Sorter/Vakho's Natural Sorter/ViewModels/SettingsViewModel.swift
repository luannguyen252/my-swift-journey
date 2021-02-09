//
//  SettingsViewModel.swift
//  Vakho's Natural Sorter
//
//  Created by Vakhtang Kontridze on 9/21/20.
//

import Foundation

// MARK:- Settings View Model
final class SettingsViewModel: ObservableObject {
    @Published var numbering: Numbering = .init(isOn: false, style: .cardinal, separator: ". ")
    
    @Published var removeDuplicates: Bool = true
    @Published var fixSpacing: Bool = true
}

// MARK:- Title Case Settings
extension SettingsViewModel {
    var asNaturalComparisonSettings: NaturalComparisonSettings {
        .init(
            numbering: numbering,
            removeDuplicates: removeDuplicates,
            fixSpacing: fixSpacing
        )
    }
    struct NaturalComparisonSettings {
        let numbering: Numbering
        
        let removeDuplicates: Bool
        let fixSpacing: Bool
    }
}
