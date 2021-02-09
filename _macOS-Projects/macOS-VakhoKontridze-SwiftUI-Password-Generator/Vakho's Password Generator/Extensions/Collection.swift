//
//  Collection.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 8/30/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation

extension Collection {
    func enumeratedArray() -> Array<(offset: Int, element: Self.Element)> {
        .init(self.enumerated())
    }
}
