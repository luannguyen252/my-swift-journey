//
//  MovieDetailViewModel.swift
//  MoviesApp
//
//  Created by Mohammad Azam on 8/2/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    
    private var movieDetail: MovieDetail?
    @Published var loadingState = LoadingState.loading
    
    private var httpClient = HTTPClient()
    
    init(movieDetail: MovieDetail? = nil) {
        self.movieDetail = movieDetail
    }
    
    func getDetailsByImdbId(imdbId: String) {
        
        httpClient.getMovieDetailsBy(imdbId: imdbId) { result in
            switch result {
                case .success(let details):
                    DispatchQueue.main.async {
                        self.movieDetail = details
                        self.loadingState = .success
                    }
                
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
                   
            }
        }
        
    }
    
    
    var title: String {
        self.movieDetail?.title ?? ""
    }
    
    var poster: String {
        self.movieDetail?.poster ?? ""
    }
    
    var plot: String {
        self.movieDetail?.plot ?? ""
    }
    
    var rating: Int {
        get {
            let ratingAsDouble = Double(self.movieDetail?.imdbRating ?? "0.0")
            return Int(ceil(ratingAsDouble ?? 0.0))
        }
    }
    
    var director: String {
        self.movieDetail?.director ?? ""
    }
    
}
