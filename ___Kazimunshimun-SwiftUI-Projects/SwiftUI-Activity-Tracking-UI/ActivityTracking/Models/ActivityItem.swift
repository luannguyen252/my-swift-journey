//
//  ActivityItem.swift
//  ActivityTracking
//
//  Created by Anik on 14/11/20.
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
