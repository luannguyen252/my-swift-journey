//
//  NewsListViewModel.swift
//  News_MVVM
//
//  Created by jb on 2020/10/12.
//

import Foundation

class NewsListViewModel: ObservableObject{
    @Published var news = [NewsViewModel]()
    @Published var imageData = [String: Data]()
    
    func load(){
        getNews()
    }
    private func getNews(){
        let networkManager = NetworkManager()

        networkManager.getNews { (newsArticles) in
            guard let news = newsArticles else {
                print("ERROR")
                return
            }
            let newsViewModel = news.map(NewsViewModel.init)
            self.getImages(for: newsViewModel)
            DispatchQueue.main.async {
                self.news = newsViewModel
            }
            
        }
    }
    private func getImages(for news: [NewsViewModel]){
        let networkManager = NetworkManager()
        news.forEach { (newsViewModel) in
            //if urlToImage is Empty
            guard !newsViewModel.urlToImage.isEmpty else {
                return
                
            }
            networkManager.getImage(urlString: newsViewModel.urlToImage) { (data) in
                guard let data = data else {
                    return
                }
                DispatchQueue.main.async {
                    // Map
                    self.imageData[newsViewModel.urlToImage] = data
                }
            }
        }
    }
}
