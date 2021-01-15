//
//  ArticlesViewModel.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import Foundation
import Resolver
import Combine

class ArticlesViewModel: ObservableObject {
    @Injected private var network: NetworkService
    
    @Published var articles = [Article]()
    @Published var loading = true
    @Published var error: NetworkService.NetworkError?
    
    private var cancellables = Set<AnyCancellable>()
    private var currentPage = 1
    private var completed = false
    
    init() {
        getArticles()
    }
    
    func loadMoreArticles() {
        guard !completed else { return }
        guard !loading else { return }
        
        getArticles()
    }
    
    private func getArticles() {
        guard !completed else { return }
        
        loading = true
        error = nil
        
        network.getArticles(page: currentPage)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.loading = false
                
                if case let .failure(error) = completion {
                    self.error = error
                }
            }, receiveValue: { articles in
                self.loading = false
                
                if self.currentPage == 1 {
                    self.articles = articles
                } else {
                    self.articles.append(contentsOf: articles)
                }
                
                self.currentPage += 1
                self.completed = articles.count < Settings.articlesPerPage
            })
            .store(in: &cancellables)
    }
}
