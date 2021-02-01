//
//  MoviesListView.swift
//  Shared
//
//  Created by Vidhyadharan on 28/12/20.
//

import SwiftUI
import SwiftUIX
import CoreData

struct MoviesListView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Movie.id, ascending: true)],
        animation: .default)
    private var movies: FetchedResults<Movie>

    @StateObject private var viewModel = MoviesViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                if viewModel.showNoData {
                    Text("Unable to load Movies list")
                } else if viewModel.isLoading {
                    ActivityIndicator()
                        .animated(true)
                        .style(.large)
                } else {
                    if viewModel.isOffline {
                        OfflineBarView()
                    }
                    ScrollView {
                        LazyVStack(spacing: 15) {
                            ForEach(movies) { movie in
                                NavigationLink(destination: MovieDetailsViewDestination(movieId: movie.id!, viewModel: viewModel)) {
                                    MovieView(movie: movie, height: 200)
                                        .background(Color.white)
                                        .cornerRadius(15)
                                        .shadow(radius: 3)
                                }
                            }.buttonStyle(PlainButtonStyle())
                        }.padding()
                    }
                }
            }
            .navigationBarTitle("Movies", displayMode: .inline)
        }
        .background(Color(UIColor.systemGray6))
    }
}

struct MovieDetailsViewDestination: View {
    let movieId: String
    let viewModel: MoviesViewModel
    
    var body: some View {
        MovieDetailsView(viewModel: MovieDetailsViewModel(movieId: movieId))
            .onDisappear(perform: {
                viewModel.loadMoviesIfNeeded()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView().environment(\.managedObjectContext, PersistenceController.preview.viewContext)
    }
}
