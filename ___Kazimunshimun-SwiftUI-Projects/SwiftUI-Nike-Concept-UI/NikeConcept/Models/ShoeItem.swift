//
//  ShoeItem.swift
//  NikeConcept
//
//  Created by Anik on 6/11/20.
//

import SwiftUI

struct ShoeItem: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let price: CGFloat
    let availableSize: [CGFloat]
}
