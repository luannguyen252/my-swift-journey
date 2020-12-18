//
//  ShoeItem.swift
//  NikeConcept
//
//  Created by Luan Nguyen on 18/12/2020.
//

import SwiftUI

struct ShoeItem: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let price: CGFloat
    let availableSize: [CGFloat]
}
