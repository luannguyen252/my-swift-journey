//
//  Endpoints.swift
//  Model
//
//  Created by josh on 2019/08/21.
//  Copyright © 2019 josh. All rights reserved.
//

import Foundation
import TinyNetworking

public let pokemonPageEndpoint: Endpoint<PokemonPage> = Endpoint(
    json: .get,
    url: URL(string: "https://pokeapi.co/api/v2/pokemon/")!
)

public func pokemonEndpoint(pokemon: Pokemon) -> Endpoint<Pokemon> {
    Endpoint(
        json: .get,
        url: URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemon.name)/")!
    )
}
