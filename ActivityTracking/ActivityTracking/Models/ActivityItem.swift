//
//  ActivityItem.swift
//  ActivityTracking
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ActivityItem: Identifiable {
    let id = UUID()
    let title: String
    let color: Color
    let imageName: String
    let imageRoataion: Double
    let progress: CGFloat
}
