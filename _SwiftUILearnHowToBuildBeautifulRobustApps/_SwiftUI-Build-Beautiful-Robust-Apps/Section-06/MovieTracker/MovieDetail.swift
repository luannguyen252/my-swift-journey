//
//  MovieDetail.swift
//  MovieTracker
//
//  Created by zappycode on 6/14/19.
//  Copyright © 2019 Nick Walter. All rights reserved.
//

/*
 
 --Accessibility--
 
 -Understandable
 -Interactable
 -Navigable

 */

import SwiftUI

struct MovieDetail : View {
    
    @State var movie: Movie
    @Environment(\.isPresented) var isPresented
    @ObjectBinding var movieStore : MovieStore
    var newMovie: Bool
    
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading) {
                    ControlTitle(title: "Title")
                    TextField($movie.title).accessibilityAction {
                        // clear The movie
                    }
                }
            }
            
            Section {
                VStack(alignment: .leading) {
                    ControlTitle(title: "Rating")
                    HStack {
                       Spacer()
                        Text(String(repeating:"★", count:Int(movie.rating))).font(.title).foregroundColor(.yellow).accessibility(label: Text("\(Int(movie.rating)) star rating"))
                        Spacer()
                    }
                    Slider(value: $movie.rating, from: 1.0, through: 5.0, by: 1.0).accessibility(addTraits: [.isSelected, .isHeader])
                }
            }
            
            Section {
                VStack(alignment: .leading) {
                    ControlTitle(title: "Watched")
                    Toggle(isOn: $movie.seen) {
                        if movie.title == "" {
                            Text("I have seen this movie")
                        } else {
                            Text("I have seen \(movie.title)")
                        }
                    }
                }
            }
            if newMovie {
                Section {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.movieStore.addMovie(movie: self.movie)
                            self.isPresented?.value = false
                        }) {
                            Text("Save")
                        }
                        Spacer()
                    }
                }
            }
        }.listStyle(.grouped)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: Movie(), movieStore: MovieStore(), newMovie:true)
    }
}
#endif

struct ControlTitle : View {
    var title: String
    
    var body: some View {
        return Text(title).font(.subheadline).foregroundColor(.gray)
    }
}
