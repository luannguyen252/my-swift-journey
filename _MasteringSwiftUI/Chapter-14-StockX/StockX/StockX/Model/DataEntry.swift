//
//  DataEntry.swift
//  StockX
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct DataEntry: Identifiable, Codable {
    var id = UUID()
    let date: Date
    let close: Double
}

let sampleData = [
    DataEntry(date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!, close: 2.33),
    DataEntry(date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, close: 17.319),
    DataEntry(date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, close: 13.94),
    DataEntry(date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, close: 20.4882)
]
