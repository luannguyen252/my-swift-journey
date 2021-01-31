//
//  MovieViewModel.swift
//  iMovie
//
//  Created by Sandesh on 11/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import UIKit
protocol MovieViewModelDelegate {
    func didReceived(_ image: UIImage, named: String)
}

class MovieViewModel: Hashable {
   
    private let id = UUID()
    private var movie: Movie
    private var moviePosterData: Data?
    
    var delegate: MovieViewModelDelegate?
    
    init(movie: Movie) {
        self.movie = movie
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: MovieViewModel, rhs: MovieViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    func getImage() {
        if moviePosterData != nil {
            let image = UIImage(data: moviePosterData!)!
            delegate?.didReceived(image, named: movie.poster_path!)
        } else {
            fetchImage()
        }
    }
    
    private func fetchImage() {
        ImageRequest.make(posterImage) { data in
            if data != nil {
                DispatchQueue.main.async {
                    self.moviePosterData = data
                    if let image = UIImage(data: data!) {
                        self.delegate?.didReceived(image,named: self.posterImage)
                    } else {
                        let image = UIImage(systemName: "film")!.withRenderingMode(.alwaysOriginal)
                        self.delegate?.didReceived(image, named: "film")
                    }
                }
            }
        }
    }
    
    //MARK:- Getters
    var title: String { movie.title}
    var description: String { movie.overview }
    var posterImage: String { movie.poster_path! }
    var popularity: String { return  String(format: "👑 %.2f", movie.popularity) }
    var releaseDate: String {
        let date = Calendar.shared.convertString(date: movie.release_date, from: "yyyy-MM-dd", to: "MMM d, yyyy")
        return date == nil ? "-" : date!
    }
    var duration: String { "" }
}
