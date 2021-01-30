//
//  RecipeModel.swift
//  Avacados
//
//  Created by Sandesh on 28/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

struct Recipe: Identifiable{
    let id = UUID()
    let title: String
    let headline: String
    let image: String
    let rating: Int
    let serves: Int
    let preparation: Int
    let cooking: Int
    let instructions: [String]
    let ingredients: [String]
}


