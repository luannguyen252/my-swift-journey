//
//  Data.swift
//  StepCounter
//
//  Created by Anik on 18/8/20.
//

import SwiftUI

let data = [
    DataItem(imageName: "drop.fill", imageColor: Color.blue, value: "0", unit: "Mile"),
    DataItem(imageName: "flame.fill", imageColor: Color.orange, value: "0", unit: "Kcal"),
    DataItem(imageName: "stopwatch.fill", imageColor: Color.green, value: "0\u{1D0D}", unit: "Time")
]

struct DataItem {
    let id = UUID()
    let imageName: String
    let imageColor: Color
    var value: String
    let unit: String
}

struct StepData {
    var count: Int = 0
    var mileCount: CGFloat = 0
    var caloryCount: Int = 0
    var minuteCount: Int = 0
    var goal: Int
}
