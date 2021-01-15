//
//  PokemonStore.swift
//  Model
//
//  Created by josh on 2019/08/06.
//  Copyright © 2019 josh. All rights reserved.
//

public extension Result {
    var value: Success? {
        switch self {
        case .success(let value): return value
        case .failure: return nil
        }
    }
    var error: Failure? {
        switch self {
        case .success: return nil
        case .failure(let error): return error
        }
    }
}
