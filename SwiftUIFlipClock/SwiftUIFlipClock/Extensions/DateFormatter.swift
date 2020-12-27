//
//  DateFormatter.swift
//  SwiftUIFlipClock
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

extension DateFormatter {
    static var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HHmmss"
        return formatter
    }
}
