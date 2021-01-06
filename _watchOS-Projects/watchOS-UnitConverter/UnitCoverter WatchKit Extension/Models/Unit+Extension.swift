//
//  Unit+Extension.swift
//  UnitCoverter WatchKit Extension
//
//  Created by Alfian Losari on 14/09/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import Foundation

extension Unit: Identifiable {
    public var id: String {
        return self.symbol
    }
}
