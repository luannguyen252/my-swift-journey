//
//  Character.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 8/29/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation

extension Character {
    var type: CharacterSet? {
        if CharacterSet.lowercase.characters().contains(self) { return .lowercase }
        if CharacterSet.uppercase.characters().contains(self) { return .uppercase }
        if CharacterSet.digits.characters().contains(self) { return .digits }
        if CharacterSet.symbols.characters().contains(self) { return .symbols }
        if CharacterSet.ambiguous.characters().contains(self) { return .ambiguous }
        return nil
    }
}
