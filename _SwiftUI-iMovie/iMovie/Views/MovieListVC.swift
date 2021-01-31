//
//  MovieListVC.swift
//  iMovie
//
//  Created by Sandesh on 11/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import UIKit

class MovieListVC: UICollectionViewController {

    var model: MovieListViewModel!
    
    private lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchBar.delegate = self
        controller.searchBar.searchTextField.placeholder = "Search Movies"
        controller.searchBar.barStyle = .default
        return controller
    }()
    
    //MARK:- Life Cycle Methods
    override func viewDidLoad() {
        setupNavigationBar()
        setupCollectioncView()
        bindModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        model.viewWillAppear()
    }
    
    //MARK:- Private methods
    private func setupNavigationBar() {
        title = model.title
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        let backLabel = UILabel()
        backLabel.backgroundColor = . systemRed
        backLabel.text = "Back"
        backLabel.textColor = .white
        backLabel.frame.size.height = 30
        backLabel.frame.size.width = 75
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .label
    }
    private func bindModel() {
        model.delegate = self
        model.dataSource = self
    }
    
    private func setupCollectioncView() {
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.IDENTIFIER)
        collectionView.backgroundColor = UIColor(named: "background")!
        collectionView.collectionViewLayout = collectionViewLayout()
        collectionView.dataSource =  model.setDataSourceFor(collectionView)
    }
    
    private func collectionViewLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: traitCollection.horizontalSizeClass == .compact ?  .fractionalWidth(1.0) : .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    //MARK:- Collection view delegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        model.itemSelected(at: indexPath)
    }
}

extension MovieListVC: MovieListViewModelDelegate {
    func present(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension MovieListVC: MovieListViewModelDataSource {
}

extension MovieListVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        model.filterMovies(searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        model.filterMovies("")
    }
}
