//
//  Card.swift
//  Compositional Layout (iOS)
//
//  Created by Balaji on 31/12/20.
//

import SwiftUI

struct Card: Identifiable,Decodable,Hashable {

    var id: String
    var download_url: String
    var author: String
}

