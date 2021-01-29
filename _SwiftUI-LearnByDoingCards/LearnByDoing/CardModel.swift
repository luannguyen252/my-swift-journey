//
//  CardModel.swift
//  LearnByDoing
//
//  Created by Sandesh on 22/03/20.
//  Copyright © 2020 Sandesh. All rights reserved.
//

import SwiftUI

// MARK: - CARD

struct Card: Identifiable {
    var id = UUID()
    
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
