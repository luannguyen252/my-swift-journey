//
//  AddMovieViewModel.swift
//  SwiftUICombineMVVMExample
//
//  Created by Toomas Vahter on 03.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import Combine
import SwiftUI

extension AddMovieView {
    class ViewModel: ObservableObject {
        private let movieStore: MovieStore
        
        init(movieStore: MovieStore) {
            self.movieStore = movieStore
        }
        
        @Published private var newMovie = Movie(fullTitle: "")
        
        lazy var title = Binding<String>(get: {
            self.newMovie.fullTitle
        }, set: {
            self.newMovie.fullTitle = $0
        })
        
        lazy var rating = Binding<Movie.Rating>(get: {
            self.newMovie.givenRating
        }, set: {
            self.newMovie.givenRating = $0
        })
        
        var canSave: Bool {
            return !newMovie.fullTitle.isEmpty
        }
        
        func save() {
            movieStore.add(newMovie)
        }
    }
}
