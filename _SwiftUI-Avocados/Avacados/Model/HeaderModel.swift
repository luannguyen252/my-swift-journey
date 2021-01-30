//
//  HeaderModel.swift
//  Avacados
//
//  Created by Sandesh on 19/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import Foundation

//MARK:- Header Model

struct Header: Identifiable {
    var id = UUID()
    var image: String
    var headline: String
    var subheadline: String
}
