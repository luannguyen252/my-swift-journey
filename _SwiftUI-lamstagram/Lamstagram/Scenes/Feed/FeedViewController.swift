//
//  FeedViewController.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 12/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    @IBOutlet weak var feedTableView: UITableView!
    
    var viewModel: FeedViewModel
    weak var coordinator: FeedCoordinator?
    
    init?(coder: NSCoder, viewModel: FeedViewModel, coordinator: FeedCoordinator) {
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
        
        navigationItem.title = "Feed"
        navigationController?.navigationBar.prefersLargeTitles = true
        feedTableView.contentInsetAdjustmentBehavior = .never
        
        feedTableView.register(PostTableViewCell.self)
        
        viewModel.getPosts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        coordinator?.showHelloWorldMessage()
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = viewModel.getPost(for: indexPath.row)
        
        let cell: PostTableViewCell = feedTableView.dequeueReusableCell(for: indexPath)
        
        if let user = post.user {
            let viewModel = PostCellViewModel(
                user: user,
                photoName: post.imageName
            )
            
            cell.viewModel = viewModel
        }
        
        return cell
    }
}

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        feedTableView.deselectRow(at: indexPath, animated: false)
        
        let post = viewModel.getPost(for: indexPath.row)
        
        coordinator?.showPostDetail(post: post)
    }
}

extension FeedViewController: FeedViewModelDelegate {
    func stateDidChange(previousState: State) {
        switch viewModel.state {
        case .ready:
            feedTableView.reloadData()
        case .failed(let error):
            print(error)
        default:
            break
        }
    }
}
