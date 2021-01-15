//
//  StargazersViewModel.swift
//  StargazersSwiftUI
//
//  Created by Gualtiero Frigerio on 18/04/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import Combine

class StargazersViewModel:ObservableObject {
    @Published var stargazers:[User] = []
    
    init() {
        restClient = SimpleRESTClient()
        dataSource = DataSource(withClient: restClient, baseURLString: "https://api.github.com")
        
        self.owner = ""
        self.repository = ""
    }
    
    func getNextStargazers(completion: @escaping(Bool) ->Void) {
        dataSource.getStargazers(owner:owner, repo:repository, page:currentPage) { stargazers,_  in
            DispatchQueue.main.async {
                if let stargazers = stargazers {
                    self.currentPage += 1
                    self.stargazers.append(contentsOf: stargazers)
                    completion(true)
                }
                else {
                    completion(false)
                }
            }
        }
    }
    
    func isLastStargazer(_ stargazer:User) -> Bool {
        if let last = self.stargazers.last {
            return last == stargazer
        }
        return false
    }
    
    func setTarget(owner:String, repository:String) {
        self.owner = owner
        self.repository = repository
        self.stargazers = []
        self.currentPage = 0
    }
    
    //MARK: - Private
    private var currentPage = 0
    private var dataSource:DataSource
    private var owner:String
    private var repository:String
    private var restClient:RESTClient
}
