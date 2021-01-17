//
//  ProfileViewModel.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 14/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import Foundation

final class ProfileViewModel {
    enum Section: Int {
        case profile
        case friends
        case photos
    }
    
    let userService: UserServicing
    
    weak var delegate: ProfileViewModelDelegate?

    var state: State = .initial {
        didSet {
            DispatchQueue.main.async {
                self.delegate?.stateDidChange(previousState: oldValue)
            }
        }
    }
    
    var sections: [Section] {
        var sections = [Section]()
        
        sections.append(.profile)
        
        if user?.friends?.isEmpty == false {
            sections.append(.friends)
        }
        
        if user?.posts?.isEmpty == false {
            sections.append(.photos)
        }
        
        return sections
    }
    
    var userID: Int?
    var user: User?

    init(userService: UserServicing) {
        self.userService = userService
    }
}

// MARK: - Data source

extension ProfileViewModel {
    func getNumberOfItems(for index: Int) -> Int {
        switch sections[index] {
        case .profile:
            return 1
        case .friends:
            return user?.friends?.count ?? 0
        case .photos:
            return user?.posts?.count ?? 0
        }
    }
    
    func getSection(for index: Int) -> Section {
        sections[index]
    }
    
    func getFriend(for index: Int) -> User? {
        guard let friends = user?.friends else {
            return nil
        }
        
        return friends[index]
    }
    
    func getPost(for index: Int) -> Post? {
        guard let posts = user?.posts else {
            return nil
        }
        
        return posts[index]
    }
}

// MARK: - ViewModeling

extension ProfileViewModel: ViewModeling {}

// MARK: - API

extension ProfileViewModel {
    func getUser() {
        guard let userID = userID else {
            return
        }
        
        userService.getUser(id: userID) { result in
            switch result {
            case .success(let user):
                self.user = user
                
                self.state = .ready
            case .failure(let error):
                self.state = .failed(error)
            }
        }
    }
}
