//
//  ImageModel.swift
//  PhotoMacApp
//
//  Created by Luan Nguyen on 12/12/2020.
//

import SwiftUI

struct ImageModel: Codable, Identifiable {
    var id: String
    var download_url: String
    var onHover: Bool? // Optional not for JSON
}
