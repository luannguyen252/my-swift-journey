//
//  Book.swift
//  StackedCarouselSlider
//
//  Created by Luan Nguyen on 12/12/2020.
//

import SwiftUI

struct Book: Identifiable {
    var id: Int
    var image: String
    var title: String
    var author: String
    var rating: Int
    var offset: CGFloat
}
