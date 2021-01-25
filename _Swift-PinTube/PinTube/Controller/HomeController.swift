//
//  ViewController.swift
//  PinTube
//
//  Created by Daval Cato on 2/17/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import StoreKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var videos: [Video]?
    
    let cellId = "cellId"
    let trendingCellId = "trendingCellId"
    let subscriptionCellId = "subscriptionCellId"
    
    let titles = ["Home", "Trending", "Camera", "Account"]
    

    // MARK: - Properties

//    var welcomeLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.font = UIFont.systemFont(ofSize: 28)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.alpha = 0
//        return label
//
//    }()
    
    
    // MARK: Int
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let ref = Database.database().reference()
        
        ref.child("someid").observeSingleEvent(of: .value) { (snapshot) in
            let employeedata = snapshot.value as? [String:Any]
            
            authenticateUserAndConfigureView()
        
//            let time = DispatchTime.now() + 3
//            DispatchQueue.main.asyncAfter(deadline: time) {
//                IAPManager.sharedInstance.askForReview()
//            }
            
        }
        
        
        // MARK: - API

        func loadUserData() {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            Database.database().reference().child("users").child(uid).child("username").observeSingleEvent(of: .value) { (snapshot) in
//                guard let username = snapshot.value as? String else { return }
//                self.welcomeLabel.text = "Welcome, \(username)"
//
//                UIView.animate(withDuration: 0.5, animations: {
//                    self.welcomeLabel.alpha = 1
//                })
            }
        }

        func authenticateUserAndConfigureView() {
            if Auth.auth().currentUser == nil {
                DispatchQueue.main.async {
                    let navController = UINavigationController(rootViewController: LoginController())
                    navController.navigationBar.barStyle = .black
                    self.present(navController, animated: true, completion: nil)
                }
            } else {
                configureViewComponents()
                loadUserData()
            }
        }
//
//        // MARK: Helper Functions
//
        func configureViewComponents() {
            view.backgroundColor = UIColor.mainBlue()

            navigationItem.title = ""

            navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "baseline_arrow_back_white_24dp"), style: .plain, target: self, action: #selector(handleSignOut))
            
            navigationItem.leftBarButtonItem?.tintColor = .white
            navigationController?.navigationBar.barTintColor = UIColor.mainBlue()

//            view.addSubview(welcomeLabel)
//            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }

        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: -332, height: 21))
        titleLabel.text = "  Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        setupCollectionView()
        setupMenuBar()
        setupNavBarButtons()
        
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            let navController = UINavigationController(rootViewController: LoginController())
            navController.navigationBar.barStyle = .black
            self.present(navController, animated: true, completion: nil)
        } catch let error {
            print("Failed to sign out with error..", error)
        }
    }
    
     // MARK: - Selectors
    
    @objc func handleSignOut() {
        let alertController = UIAlertController(title: nil, message: "Are you sure you want to sign out?", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { (_) in
            self.signOut()
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
        
    }
    
    func setupCollectionView() {
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = UIColor.white
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(TrendingCell.self, forCellWithReuseIdentifier: trendingCellId)
        collectionView.register(SubscriptionCell.self, forCellWithReuseIdentifier: subscriptionCellId)
        
        
        collectionView.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
        collectionView.isPagingEnabled = true
    }
    
    
    func setupNavBarButtons() {
        let searchImage = UIImage(named: "search_icon")!.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        let moreButton = UIBarButtonItem(image: UIImage(named: "nav_more_icon")!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [moreButton, searchBarButtonItem]
        
    }
    
    lazy var settingsLauncher: SettingsLauncher = {
        let launcher = SettingsLauncher()
        launcher.homeController = self
        return launcher
    }()
    
    @objc func handleMore() {
        //show menu
        settingsLauncher.showSettings()
        
    }
    
    func showControllerForSetting(setting: Setting) {
        let dummySettingsViewController = UIViewController()
        dummySettingsViewController.view.backgroundColor = UIColor.white
        dummySettingsViewController.navigationItem.title = setting.name.rawValue
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationController?.pushViewController(dummySettingsViewController, animated: true)
        
    }
    
    @objc func handleSearch() {
       scrollToMenuIndex(menuIndex: 2)
    }
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
        
        setTitleForIndex(index: menuIndex)
        
    }
    
    private func setTitleForIndex(index: Int) {
        if let titleLable = navigationItem.titleView as? UILabel {
            titleLable.text = " \(titles[index]) "
        }
        
    }
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.homeController = self
        return mb
        
    }()
    
    private func setupMenuBar() {
        navigationController?.hidesBarsOnSwipe = true
        
        let greenview = UIView()
        greenview.backgroundColor = UIColor.rgb(red: 156, green: 181, blue: 108)
        view.addSubview(greenview)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: greenview)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]|", views: greenview)
        
        
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: menuBar)
        
        if #available(iOS 11.0, *) {
            menuBar.topAnchor.constraint(equalToSystemSpacingBelow: topLayoutGuide.bottomAnchor, multiplier: 1.0).isActive = true
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 4
    }
  
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.pointee.x / view.frame.width
        
        let indexPath = NSIndexPath(item: Int(index), section: 0)
      
        menuBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: [])
        
//        if let titleLable = navigationItem.titleView as? UILabel {
//            titleLable.text = " \(titles[Int(index)]) "
//        }
        
        setTitleForIndex(index: Int(index))
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier: String
        if indexPath.item == 1 {
            identifier = trendingCellId
        } else if indexPath.item == 2 {
            identifier = subscriptionCellId
        } else {
            identifier = cellId
            
            
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 50)
    }
    
}






