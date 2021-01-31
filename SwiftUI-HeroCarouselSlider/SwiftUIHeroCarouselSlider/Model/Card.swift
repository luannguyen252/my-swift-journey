//
//  Card.swift
//  SwiftUIHeroCarouselSlider
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

struct Card: Identifiable {
    var id = UUID().uuidString
    var cardColor: Color
    var offset: CGFloat = 0
    var title: String
}
