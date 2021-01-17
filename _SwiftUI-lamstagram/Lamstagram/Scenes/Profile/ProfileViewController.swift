//
//  ProfileViewController.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 12/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    var viewModel: ProfileViewModel!
    weak var coordinator: ProfileCoordinator?
    
    init?(coder: NSCoder, viewModel: ProfileViewModel, coordinator: ProfileCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        
        super.init(coder: coder)
        
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this view controller with a ViewModel.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainCollectionView.register(ProfileHeaderCell.self)
        mainCollectionView.register(ProfileFriendCell.self)
        mainCollectionView.register(ProfilePhotoCell.self)
        
        let layout = createLayout()
        
        mainCollectionView.collectionViewLayout = layout
        
        viewModel.getUser()
    }
    
    func reloadData() {
        navigationItem.title = viewModel.user?.name
        
        mainCollectionView.reloadData()
    }
}

// MARK: - Layout

extension ProfileViewController {
    func createLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            switch self.viewModel.getSection(for: sectionIndex) {
            case .profile:
                return self.createProfileHeaderSection()
            case .friends:
                return self.createFriendsSection()
            case .photos:
                return self.createPhotosSection()
            }
        }
    }
    
    func createProfileHeaderSection() -> NSCollectionLayoutSection {
        let layoutSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(150)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: layoutSize)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: layoutSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        return section
    }
    
    func createFriendsSection() -> NSCollectionLayoutSection {
        let size = NSCollectionLayoutSize(
            widthDimension: .absolute(60),
            heightDimension: .absolute(80)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: size)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: size,
            subitem: item,
            count: 1
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        return section
    }
    
    func createPhotosSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(1/3)
            ),
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0)

        return section
    }
}

// MARK: - UICollectionViewDataSource

extension ProfileViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getNumberOfItems(for: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch viewModel.getSection(for: indexPath.section) {
        case .profile:
            let cell: ProfileHeaderCell = mainCollectionView.dequeueReusableCell(for: indexPath)
            
            if let user = viewModel.user {
                let cellViewModel = ProfileHeaderCellViewModel(user: user)
                cell.viewModel = cellViewModel
            }
            
            return cell
        case .friends:
            let cell: ProfileFriendCell = mainCollectionView.dequeueReusableCell(for: indexPath)
            
            if let friend = viewModel.getFriend(for: indexPath.row) {
                let cellViewModel = ProfileFriendCellViewModel(user: friend)
                cell.viewModel = cellViewModel
            }
            
            return cell
        case .photos:
            let cell: ProfilePhotoCell = mainCollectionView.dequeueReusableCell(for: indexPath)
            
            if let post = viewModel.getPost(for: indexPath.row) {
                let cellViewModel = ProfilePhotoCellViewModel(post: post)
                cell.viewModel = cellViewModel
            }
            
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegate

extension ProfileViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch viewModel.sections[indexPath.section] {
        case .friends:
            guard let friend = viewModel.getFriend(for: indexPath.row) else {
                break
            }
            
            coordinator?.showUserProfile(user: friend)
        case .photos:
            guard let post = viewModel.getPost(for: indexPath.row) else {
                break
            }
            
            coordinator?.showPostDetail(post: post)
        case .profile:
            break
        }
    }
}

// MARK: - ProfileViewModelDelegate

extension ProfileViewController: ProfileViewModelDelegate {
    func stateDidChange(previousState: State) {
        switch viewModel.state {
        case .ready:
            reloadData()
        case .failed(let error):
            print(error)
        default:
            break
        }
    }
}
