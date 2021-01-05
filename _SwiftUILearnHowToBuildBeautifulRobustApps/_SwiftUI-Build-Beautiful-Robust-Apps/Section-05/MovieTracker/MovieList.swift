//
//  MovieList.swift
//  MovieTracker
//
//  Created by zappycode on 6/18/19.
//  Copyright © 2019 Nick Walter. All rights reserved.
//

import SwiftUI

struct MovieList : View {
    
    @ObjectBinding var movieStore = MovieStore()
    
    var body: some View {
        NavigationView {
            List {
                PresentationButton(destination: MovieDetail(movie: Movie(), movieStore: movieStore, newMovie:true)) {
                    Text("Add Movie").foregroundColor(.blue)
                }
                ForEach(movieStore.movies) { movie in
                    NavigationButton(destination: MovieDetail(movie: movie, movieStore: self.movieStore, newMovie:false)) {
                        if movie.seen {
                            Text(movie.title).foregroundColor(.green)
                        } else {
                            Text(movie.title)
                        }
                    }
                }
            }
        }
    }
}

#if DEBUG
struct MovieList_Previews : PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
#endif
