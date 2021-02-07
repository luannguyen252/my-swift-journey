//
//  SeatModel.swift
//  SeatingSwfitUI
//
//  Created by Simon Bachmann on 12.12.20.
//

import Foundation
import SwiftUI

struct SeatModel: Identifiable, Hashable, Equatable {
    var id = UUID()
    var price: Double
    var color: Color
    var char: Character
    var selected: Bool = false
}
