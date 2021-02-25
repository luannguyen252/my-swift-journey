//
//  FilteredImage.swift
//  Filter
//
//  Created by Balaji on 30/09/20.
//

import SwiftUI
import CoreImage

struct FilteredImage: Identifiable {
    
    var id = UUID().uuidString
    var image: UIImage
    var filter: CIFilter
    var isEditable: Bool
}
