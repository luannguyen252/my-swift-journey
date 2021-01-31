//
//  MovieListVCModel.swift
//  iMovie
//
//  Created by Sandesh on 11/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import UIKit

protocol MovieListViewModelDelegate {
    func present(_ viewController: UIViewController)
}

protocol MovieListViewModelDataSource {
    
}


class MovieListViewModel {
    //MARK: Diffable datasource and snap shot vars
    typealias DataSource = UICollectionViewDiffableDataSource<Section, MovieViewModel>
    typealias SnapShot = NSDiffableDataSourceSnapshot<Section,MovieViewModel>
    
    enum Section: CaseIterable {
        case main
    }
    
    //MARK: View model
    enum MovieType {
        case nowPlaying
        case topRated
    }
    
    //MARK:- Private Vars
    private var movies: [MovieViewModel]! {
        didSet {
            applyMovieSnapShot()
        }
    }

    private var moviesTypes: MovieType
    private var movieDataSorce: DataSource!
    
    var delegate: MovieListViewModelDelegate?
    var dataSource: MovieListViewModelDataSource?
    
    //initializer
    init(type: MovieType) {
        self.moviesTypes = type
        switch type {
            case .nowPlaying: fetchNowPlayingMovies()
            case .topRated: fetchTopRatedMovies()
        }
    }
    
    //MARK:- Private Methods
    private func fetchNowPlayingMovies() {
        NowPlayingRequest.make { movies in
            DispatchQueue.main.async {
                self.movies = []
                self.movies =  movies.map { MovieViewModel(movie: $0) }
            }
        }
    }
    
    private func fetchTopRatedMovies() {
        TopRatedMovieRequest.make { movies in
            DispatchQueue.main.async {
                self.movies = []
                self.movies =  movies.map { MovieViewModel(movie: $0) }
            }
        }
    }
    
    private func applyMovieSnapShot() {
        var snapShot = SnapShot()
        snapShot.appendSections([.main])
        snapShot.appendItems(movies)
        movieDataSorce?.apply(snapShot, animatingDifferences: true)
    }
    
    //MARK:- Public Methods
    func setDataSourceFor(_ collectionView: UICollectionView) -> DataSource{
        movieDataSorce = DataSource(collectionView: collectionView) { (collectionView, indexPath, movieModel) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.IDENTIFIER, for: indexPath) as? MovieCell else {
                return nil
            }
            cell.movie = movieModel
            cell.delegate = self
            return cell
        }
        return movieDataSorce
    }
    
    func filterMovies(_ title: String) {
        var filteredMovies = [MovieViewModel]()
        if title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            filteredMovies = movies
        } else {
            filteredMovies = movies.filter { $0.title.contains(title)}
        }
        
        var newSnapShot = SnapShot()
        newSnapShot.appendSections([.main])
        newSnapShot.appendItems(filteredMovies)
        movieDataSorce.apply(newSnapShot, animatingDifferences: true)
        
    }
    
    func viewWillAppear() {
        if movies != nil {
           applyMovieSnapShot()
        }
    }
    
    func itemSelected(at indexPath: IndexPath) {
        guard let item = movieDataSorce.itemIdentifier(for: indexPath) else {
            fatalError("Invalid IndexPath")
        }
        let detailVC = MovieDetailVC()
        detailVC.movie = item
        delegate?.present(detailVC)
    }
    
    
    //MARK:- Getters
       var title: String {
           switch moviesTypes {
           case .nowPlaying: return "Now Playing"
           case .topRated: return " Top Rated"
           }
       }
    
    var movieListType: MovieType {
        return moviesTypes
    }
}

extension MovieListViewModel : MovieCellDelegate {
    func delete(_ movie: MovieViewModel) {
        guard let index = movies.firstIndex(of: movie) else { return }
        movies.remove(at: index)
        applyMovieSnapShot()
    }
}
