//
//  String.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 8/29/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation

extension String {
    subscript(i: Int) -> Character {
        self[index(startIndex, offsetBy: i)]
    }
    
    mutating func replace(at i: Int, with char: Character) {
        self = String(prefix(i)) + String(char) + String(dropFirst(i + 1))
    }
}
