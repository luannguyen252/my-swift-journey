//
//  PokemonPage.swift
//  Model
//
//  Created by josh on 2019/08/21.
//  Copyright © 2019 josh. All rights reserved.
//

import Foundation

public struct PokemonPage: Codable {
    public let count: Int
    public let previousPage: URL?
    public let nextPage: URL?
    public let pokemons: [Pokemon]

    enum CodingKeys: String, CodingKey {
    case count
    case previousPage = "previous"
    case nextPage = "next"
    case pokemons = "results"
    }

    public init() {
        count = 0
        pokemons = []

        previousPage = nil
        nextPage = nil
    }
}
