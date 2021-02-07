//
//  Seat.swift
//  SeatingSwfitUI
//
//  Created by Simon Bachmann on 12.12.20.
//

import Foundation
import SwiftUI

struct SeatDetailModel: Identifiable, Equatable, Comparable {
    static func <(lhs: SeatDetailModel, rhs: SeatDetailModel) -> Bool {
        lhs.price < rhs.price
    }

    var id = UUID()
    var price: Double
    var color: Color
    var category: String
    var description: String?
    var available: Bool
}
