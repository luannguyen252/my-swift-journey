//
//  MovieStore.swift
//  SwiftUICombineMVVMExample
//
//  Created by Toomas Vahter on 03.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import Combine
import SwiftUI

final class MovieStore {
    @Published private(set) var allMovies = [Movie]()
    
    func add(_ movie: Movie) {
        allMovies.append(movie)
    }
}

struct MovieStoreKey: EnvironmentKey {
    typealias Value = MovieStore
    static var defaultValue = MovieStore()
}

extension EnvironmentValues {
    var movieStore: MovieStore {
        get {
            return self[MovieStoreKey]
        }
        set {
            self[MovieStoreKey] = newValue
        }
    }
}
