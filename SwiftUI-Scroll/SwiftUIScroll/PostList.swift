//
//  PostList.swift
//  SwiftUIScroll
//
//  Created by Gualtiero Frigerio on 25/08/2020.
//

import SwiftUI

struct PostList: View {
    var posts:[Post]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("there are \(posts.count) posts")
                List(posts) { post in
                    PostView(post: post)
                }
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList(posts:[])
    }
}
