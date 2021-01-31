//
//  MovieList.swift
//  iMovie
//
//  Created by Sandesh on 14/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI


struct MovieList: View {
    @State private var searchString = ""
    private var movies = Movie.getMovies()
    
    var title: String
    
    init(title: String) {
        self.title = title
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchString)
                List(filteredMovie) { movie in
                    NavigationLink(destination: MovieDetail(movie: movie)) {
                        MovieView(movie: movie)
                            .frame(height: 180)
                    }
                }
            }
            .navigationBarTitle(Text("\(title)"), displayMode: .automatic)
            .shadow(color: .clear, radius: 0)
        }
    }
    
    private var filteredMovie: [Movie] {
        if searchString == "" { return movies }
        return movies.filter { $0.title.contains(searchString) }
    }
}

struct MovieView : View {
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    var body: some View {
        HStack(spacing: 8) {
            Image("\(movie.id)")
            .resizable()
            .frame(width: 100, height: 130)
            .padding()
            
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(movie.title)")
                    .font(.title)
                    .fontWeight(.medium)
                    .lineLimit(2)
                    .padding([.top, .trailing])
                
                Text("\(movie.overview)")
                    .lineLimit(3)
                    .padding([.trailing, .bottom])
            }
        }
        .background(Color(.init("background")))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(radius: 3)
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList(title: "Now Playing")
    }
}
