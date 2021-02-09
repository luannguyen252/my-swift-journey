//
//  Separator.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 8/29/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation

// MARK:- Separator
struct Separator {
    // MARK: Properties
    var isEnabled: Bool = false
    
    var characterChunkQuantity = 4
    static let range: ClosedRange<Int> = 4...64
    
    static let separator: String = "-"
}

// MARK: Length
extension Separator {
    func length(from characterLength: Int) -> Int {
        isEnabled ? Array(1...characterLength).chunked(into: characterChunkQuantity).count - 1 : 0
    }
    
    func totalLength(with characterLength: Int) -> Int {
        characterLength + length(from: characterLength)
    }
}
