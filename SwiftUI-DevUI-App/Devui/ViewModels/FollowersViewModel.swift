//
//  FollowersViewModel.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import Foundation
import Resolver
import Combine

class FollowersViewModel: ObservableObject {
    @Injected private var network: NetworkService
    
    @Published var followers = [Follower]()
    @Published var loading = true
    @Published var error: NetworkService.NetworkError?
    
    private var cancellables = Set<AnyCancellable>()
    private var currentPage = 1
    private var completed = false
    
    init() {
        getFollowers()
    }
    
    func loadMoreFollowers() {
        guard !completed else { return }
        guard !loading else { return }
        
        getFollowers()
    }
    
    private func getFollowers() {
        guard !completed else { return }
        
        loading = true
        error = nil
        
        network.getFollowers(page: currentPage)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.loading = false
                
                if case let .failure(error) = completion {
                    self.error = error
                }
            }, receiveValue: { followers in
                self.loading = false
                
                if self.currentPage == 1 {
                    self.followers = followers
                } else {
                    self.followers.append(contentsOf: followers)
                }
                
                self.currentPage += 1
                self.completed = followers.count < Settings.followersPerPage
            })
            .store(in: &cancellables)
    }
}
