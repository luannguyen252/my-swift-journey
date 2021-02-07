//
//  DataStore.swift
//  DesignCode.v2
//
//  Created by Tee Becker on 11/2/20.
//

import SwiftUI

class DataStore: ObservableObject{
    @Published var posts: [Post] = []
    
    // run getPost function when it is initialized
    init(){
        getPost()
    }
    
    func getPost() {
        Api().getPosts { (posts) in
            self.posts = posts
        }
    }
}
