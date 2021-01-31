//
//  Equatable+IsAnyOf.swift
//  MapWidget
//
//  Created by Felix Mau on 15.10.20.
//  Copyright © 2020 Felix Mau. All rights reserved.
//

import Foundation

extension Equatable {
    func isAny(of candidates: Self...) -> Bool {
        candidates.contains(self)
    }
}
