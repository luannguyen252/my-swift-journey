//
//  MovieDetailsView.swift
//  Movie-DB-SwiftUI
//
//  Created by Vidhyadharan on 29/12/20.
//

import SwiftUI
import SwiftUIX
import KingfisherSwiftUI

struct MovieDetailsView: View {
    
    @StateObject var viewModel: MovieDetailsViewModel

    var body: some View {
        VStack(spacing: 0) {
            if viewModel.showNoData {
                Text("Unable to load Movie details")
            } else if viewModel.isLoading {
                ActivityIndicator()
                    .animated(true)
                    .style(.large)
            } else if let movieDetails = viewModel.movieDetails {
                if viewModel.isOffline {
                    OfflineBarView()
                }
                
                ScrollView {
                    KFImage(URL(string: "\(Constants.Image.baseUrl)\(movieDetails.posterPath!)"))
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .clipped()

                    VStack(alignment: .leading, spacing: 10) {
                        Text(movieDetails.title ?? "Missing Title")
                        Text("Overview:").bold()
                        Text(movieDetails.overview ?? "No Overview")
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(.horizontal, 8)
                    Spacer()
                }
            }
        }
        .navigationBarTitle("Movie Details", displayMode: .inline)

    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieDetailsView(viewModel: MovieDetailsViewModel(movieId: "283566"))
        }
    }
}
