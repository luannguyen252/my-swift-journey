//
//  ContentViewModel.swift
//  SwiftUIScroll
//
//  Created by Gualtiero Frigerio on 25/08/2020.
//

import Foundation
import Combine

class ContentViewModel:ObservableObject {
    @Published var allPosts:[Post] = []
    var dataSource = DataSource()
    
    init() {
        getAllPosts()
    }
    
    func getAllPosts() {
        dataSource.getAllPost { posts in
            if let posts = posts {
                self.allPosts = posts
            }
        }
    }
}
