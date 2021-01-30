//
//  RipeningModel.swift
//  Avacados
//
//  Created by Sandesh on 31/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

struct Ripening: Identifiable {
    var id = UUID()
    var image: String
    var stage: String
    var title: String
    var description: String
    var ripeness: String
    var instruction: String
}
