//
//  FactsModel.swift
//  Avacados
//
//  Created by Sandesh on 28/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

struct Fact: Identifiable {
    var id = UUID()
    var image: String
    var content: String
}
