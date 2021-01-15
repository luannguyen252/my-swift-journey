//
//  HouseMetadataModel.swift
//  Game-of-Thrones-SwiftUI
//
//  Created by Christian Elies on 02.08.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import SwiftUI

struct HouseMetadataModel: Hashable {
    let url: URL
    let name: String
}

extension HouseMetadataModel: Identifiable {
    var id: URL { url }
}
