//
//  MovieCell.swift
//  iMovie
//
//  Created by Sandesh on 11/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import UIKit

protocol MovieCellDelegate {
    func delete(_ movie: MovieViewModel)
}

class MovieCell: UICollectionViewCell {
    static let IDENTIFIER = "movie_cell"
    
    var movie: MovieViewModel? {
        didSet {
            if movie != nil {
                movie!.delegate = self
                updateUI()
            }
        }
    }
    
    var delegate: MovieCellDelegate?
    
    //MARK: Subviews
    private lazy var movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView.forAutolayout()
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.minimumScaleFactor = 0.8
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label.forAutolayout()
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.minimumScaleFactor = 0.8
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        return label.forAutolayout()
    }()

    private lazy var actioView: UIView = {
        return getActionView()
    }()
    
    //MARK:- Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubView()
        setupView()
        addSwipeGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK:- Overriden Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        movieImage.image = nil
        actioView.removeFromSuperview()
    }

    //MARK:- Private Methods
    private func setupSubView() {
        addSubview(movieImage)
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            bottomAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 8),
            movieImage.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 12),
            trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8)
        ])
        
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -8),
            descriptionLabel.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 12),
            trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: 8),
            bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupView() {
        layer.cornerRadius = 8
        backgroundColor = .systemBackground
    }
    
    private func addSwipeGesture() {
        let swipeGesture = UISwipeGestureRecognizer()
        swipeGesture.numberOfTouchesRequired = 1
        swipeGesture.direction = [.left]
        swipeGesture.addTarget(self, action: #selector(userSwipedLeft(_:)))
        addGestureRecognizer(swipeGesture)
    }
    private func updateUI() {
        movie!.getImage()
        titleLabel.text = movie!.title
        descriptionLabel.text = movie!.description
    }
    
    @objc private func userSwipedLeft(_ getture: UISwipeGestureRecognizer) {
        addSubview(actioView)
        actioView.frame = CGRect(x: bounds.maxX, y: 0, width: 100, height: bounds.height)
        clipsToBounds = true
        UIView.animate(withDuration: 0.2) {
            self.actioView.frame.origin.x -= 100
        }
    }
    
    @objc private func deleteCell(_ sender: UIButton) {
        delegate?.delete(movie!)
    }
    
    @objc private func cancelDeletion(_ seder: UIButton) {
        UIView.animate(withDuration: 0.2, animations: {  self.actioView.frame.origin.x += 100 }) { completed in
            if completed {
                self.actioView.removeFromSuperview()
            }
        }
    }
    
    func getActionView() -> UIView {
        let actionView = UIView()
        
        let deleteAction = getDeleteButton()
        let cancelDeleteAction = getCancelDeleteButton()
        actionView.addSubview(deleteAction)
        actionView.addSubview(cancelDeleteAction)
        
        NSLayoutConstraint.activate([
            deleteAction.leftAnchor.constraint(equalTo: actionView.leftAnchor),
            deleteAction.topAnchor.constraint(equalTo: actionView.topAnchor),
            deleteAction.bottomAnchor.constraint(equalTo: actionView.bottomAnchor),
            deleteAction.widthAnchor.constraint(equalToConstant: 50),
            
            cancelDeleteAction.leftAnchor.constraint(equalTo: deleteAction.rightAnchor),
            
            cancelDeleteAction.topAnchor.constraint(equalTo: actionView.topAnchor),
            cancelDeleteAction.bottomAnchor.constraint(equalTo: actionView.bottomAnchor),
            cancelDeleteAction.widthAnchor.constraint(equalToConstant: 50),
        ])
        
        return actionView
    }
    
    private func getDeleteButton() -> UIButton {
        let deleteButton = UIButton()
        deleteButton.backgroundColor = .systemRed
        deleteButton.setImage(UIImage(systemName: "trash.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25)), for: .normal)
        deleteButton.tintColor = .white
        deleteButton.addTarget(self, action: #selector(deleteCell(_:)), for: .touchUpInside)
        
        return deleteButton.forAutolayout()
    }
    
    private func getCancelDeleteButton() -> UIButton {
        let cancelDeleteButton = UIButton()
        
        cancelDeleteButton.backgroundColor = .systemGreen
        cancelDeleteButton.setImage(UIImage(systemName: "x.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25)), for: .normal)
        cancelDeleteButton.tintColor = .white
        cancelDeleteButton.addTarget(self, action: #selector(cancelDeletion(_:)), for: .touchUpInside)
        
        return cancelDeleteButton.forAutolayout()
    }
}


extension MovieCell: MovieViewModelDelegate {    
    func didReceived(_ image: UIImage, named: String) {
        if named == movie!.posterImage || named == "film" {
            movieImage.image = image
        }
    }
}
