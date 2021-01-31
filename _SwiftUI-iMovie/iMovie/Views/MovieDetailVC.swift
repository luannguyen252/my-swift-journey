//
//  MovieDetailVC.swift
//  iMovie
//
//  Created by Sandesh on 13/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import UIKit

class MovieDetailVC: UIViewController {
    
    var movie: MovieViewModel?
    
    //SubViews
    private lazy var movieImage: UIImageView = {
          let imageView = UIImageView()
          imageView.contentMode = .scaleAspectFill
          imageView.layer.cornerRadius = 8
          imageView.clipsToBounds = true
          return imageView.forAutolayout()
    }()
    
    private lazy var titleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.minimumScaleFactor = 0.8
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label.forAutolayout()
    }()
    
    private lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 1
        return label.forAutolayout()
    }()
    
    private lazy var popularityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 1
        label.setContentHuggingPriority(UILayoutPriority(rawValue: 252), for: .horizontal)
        return label.forAutolayout()
    }()
    
    private lazy var movieLenghtLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 1
        label.textAlignment = .right
        return label.forAutolayout()
    }()
    
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 0
        return label.forAutolayout()
    }()
    
    
    //MARK:- Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigtionView()
        setupSubViews()
        loadMovieData()
    }
    
    private func setupNavigtionView() {
    }
    
    private func setupSubViews() {
        view.addSubview(movieImage)
        
        NSLayoutConstraint.activate([
            movieImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            movieImage.topAnchor.constraint(equalTo: view.topAnchor),
            movieImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            movieImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let detailView = getDetailView()
        
        view.addSubview(detailView)
        NSLayoutConstraint.activate([
            detailView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8),
            detailView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
  
        
    }
    
    private func getDetailView() -> UIView {
        let detailView = UIView()
        
        detailView.addSubview(titleLable)
        
        NSLayoutConstraint.activate([
            titleLable.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 10),
            titleLable.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 10),
            titleLable.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -10)
        ])
        
        detailView.addSubview(releaseDateLabel)
        
        NSLayoutConstraint.activate([
            releaseDateLabel.leadingAnchor.constraint(equalTo: titleLable.leadingAnchor, constant: 0),
            releaseDateLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 8),
            releaseDateLabel.trailingAnchor.constraint(equalTo: titleLable.trailingAnchor, constant: 0)
        ])
        
        detailView.addSubview(popularityLabel)
        
        NSLayoutConstraint.activate([
            popularityLabel.leadingAnchor.constraint(equalTo: releaseDateLabel.leadingAnchor, constant: 0),
            popularityLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 8),
        ])
        
        detailView.addSubview(movieLenghtLabel)
        
        NSLayoutConstraint.activate([
            movieLenghtLabel.leadingAnchor.constraint(equalTo: popularityLabel.trailingAnchor),
            movieLenghtLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 8),
            movieLenghtLabel.trailingAnchor.constraint(equalTo: releaseDateLabel.trailingAnchor, constant: 0)
            
        ])
        
        detailView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: popularityLabel.leadingAnchor, constant: 0),
            descriptionLabel.topAnchor.constraint(equalTo: popularityLabel.bottomAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: movieLenghtLabel.trailingAnchor, constant: 0),
            descriptionLabel.bottomAnchor.constraint(equalTo: detailView.bottomAnchor, constant: -10)
        ])
        
        detailView.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.9)
        detailView.layer.cornerRadius = 8
        detailView.clipsToBounds = true
        return detailView.forAutolayout()
    }
    
    private func loadMovieData() {
        guard let movie = movie else { fatalError("Forgot to set movie value") }
        movie.delegate = self
        movie.getImage()
        
        titleLable.text = movie.title
        releaseDateLabel.text = movie.releaseDate
        popularityLabel.text = movie.popularity
        movieLenghtLabel.text = movie.duration
        descriptionLabel.text = movie.description
        
    }
    
}

extension MovieDetailVC: MovieViewModelDelegate {
    func didReceived(_ image: UIImage, named: String) {
        movieImage.image = image
    }
}

