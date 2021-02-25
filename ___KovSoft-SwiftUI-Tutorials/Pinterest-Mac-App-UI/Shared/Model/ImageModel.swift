//
//  ImageModel.swift
//  Pinterest (iOS)
//
//  Created by Balaji on 06/12/20.
//

import SwiftUI

struct ImageModel: Codable,Identifiable {
    
    var id: String
    var download_url: String
    var onHover: Bool?//optional not for JSOn...
}
