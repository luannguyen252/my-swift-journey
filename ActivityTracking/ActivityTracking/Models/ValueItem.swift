//
//  ValueItem.swift
//  ActivityTracking
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ValueItem: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let value: Int
    var selected: Bool
    let imageColor: Color
    let imageRotation: Double
    var caloryData: [CaloryData]
}
