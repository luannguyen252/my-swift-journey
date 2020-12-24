//
//  CaloryData.swift
//  ActivityTracking
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct CaloryData: Identifiable {
    let id = UUID()
    let hour: String
    let value: CGFloat
    var selected = false
}
