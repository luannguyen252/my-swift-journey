//
//  Array.swift
//  Vakho's Case Converter
//
//  Created by Vakhtang Kontridze on 8/31/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation

extension Array {
    func element(at index: Int) -> Element? {
        guard index >= 0 && index < count else { return nil }
        return self[index]
    }
}
extension String {
    func element(at index: Int) -> Character? {
        Array(self).element(at: index)
    }
}
