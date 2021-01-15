//
//  PostForEach.swift
//  SwiftUIScroll
//
//  Created by Gualtiero Frigerio on 28/08/2020.
//

import SwiftUI

struct PostForEach: View {
    var posts:[Post]
    var lazy:Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                if lazy {
                    LazyVStack {
                        ForEach(posts) { post in
                            PostView(post: post)
                        }
                    }
                }
                else {
                    VStack {
                        ForEach(posts) { post in
                            PostView(post: post)
                        }
                    }
                }
            }
        }
    }
}

struct PostForEach_Previews: PreviewProvider {
    static var previews: some View {
        PostForEach(posts:[])
    }
}
