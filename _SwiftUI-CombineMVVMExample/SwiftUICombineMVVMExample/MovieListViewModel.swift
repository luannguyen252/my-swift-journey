//
//  MovieListViewModel.swift
//  SwiftUICombineMVVMExample
//
//  Created by Toomas Vahter on 03.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import Combine
import SwiftUI

extension MovieListView {
    final class ViewModel: ObservableObject {
        private let movieStore: MovieStore
        private var cancellables = [AnyCancellable]()
        
        init(movieStore: MovieStore) {
            self.movieStore = movieStore
            cancellables.append(movieStore.$allMovies.assign(to: \.movies, on: self))
        }
        
        @Published private(set) var movies = [Movie]()
        @Published var isPresentingAddMovie = false
    }
}
