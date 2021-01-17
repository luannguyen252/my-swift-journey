//
//  FeedViewModel.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 14/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import Foundation

final class FeedViewModel {
    let postService: PostServicing

    weak var delegate: FeedViewModelDelegate?

    var state: State = .initial {
        didSet {
            DispatchQueue.main.async {
                self.delegate?.stateDidChange(previousState: oldValue)
            }
        }
    }
    
    var posts = [Post]()

    init(postService: PostServicing) {
        self.postService = postService
    }
}

// MARK: - Data Source

extension FeedViewModel {
    func getPost(for index: Int) -> Post {
        return posts[index]
    }
}

// MARK: - ViewModeling

extension FeedViewModel: ViewModeling {}

// MARK: - API

extension FeedViewModel {
    func getPosts() {
        postService.getPosts() { result in
            switch result {
            case .success(let posts):
                self.posts = posts
                
                self.state = .ready
            case .failure(let error):
                self.state = .failed(error)
            }
        }
    }
}
