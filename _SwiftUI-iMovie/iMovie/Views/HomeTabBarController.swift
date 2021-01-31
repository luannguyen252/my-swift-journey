//
//  HomeTabBarController.swift
//  iMovie
//
//  Created by Sandesh on 11/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootVC1 = MovieListVC(collectionViewLayout: UICollectionViewFlowLayout())
        rootVC1.model = MovieListViewModel(type: .nowPlaying)
        let nowPlayingMovies = UINavigationController(rootViewController: rootVC1)
        nowPlayingMovies.view.backgroundColor = UIColor(named: "background")!
        nowPlayingMovies.tabBarItem.title = "Now Showing"
        nowPlayingMovies.tabBarItem.image = UIImage(systemName: "play.rectangle", withConfiguration: UIImage.SymbolConfiguration(scale: .medium))!
        
        let rootVC2 = MovieListVC(collectionViewLayout: UICollectionViewFlowLayout())
        rootVC2.model = MovieListViewModel(type: .topRated)
        let topRatedMovies = UINavigationController(rootViewController: rootVC2)
        topRatedMovies.view.backgroundColor = UIColor(named: "background")!
        topRatedMovies.tabBarItem.title = "Top Rated"
        topRatedMovies.tabBarItem.image = UIImage(systemName: "star",  withConfiguration: UIImage.SymbolConfiguration(scale: .medium))!
        
        tabBar.tintColor = .systemRed
        tabBar.unselectedItemTintColor = .systemGray
        
        viewControllers = [nowPlayingMovies, topRatedMovies]
    }
    
}
