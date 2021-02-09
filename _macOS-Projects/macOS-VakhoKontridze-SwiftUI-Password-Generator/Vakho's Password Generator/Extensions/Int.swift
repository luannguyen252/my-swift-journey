//
//  Int.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 8/29/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation

extension Int {
    func times(_ block: () -> Void) {
        guard self > 0 else { return }
        for _ in 0..<self { block() }
    }
}
