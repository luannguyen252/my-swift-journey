//
//  Asset.swift
//  Signal_ImagePicker (iOS)
//
//  Created by Balaji on 09/02/21.
//

import SwiftUI
import Photos

struct Asset: Identifiable {
    var id = UUID().uuidString
    var asset: PHAsset
    var image: UIImage
}

