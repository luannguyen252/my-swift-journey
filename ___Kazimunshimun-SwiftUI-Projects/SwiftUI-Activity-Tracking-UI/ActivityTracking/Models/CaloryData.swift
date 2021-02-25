//
//  CaloryData.swift
//  ActivityTracking
//
//  Created by Anik on 14/11/20.
//

import SwiftUI

struct CaloryData: Identifiable {
    let id = UUID()
    let hour: String
    let value: CGFloat
    var selected = false
}
