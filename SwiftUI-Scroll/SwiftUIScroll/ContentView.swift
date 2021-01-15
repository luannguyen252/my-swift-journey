//
//  ContentView.swift
//  SwiftUIScroll
//
//  Created by Gualtiero Frigerio on 24/08/2020.
//

import SwiftUI

struct ContentView: View {
    let model:ContentViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("PostList",
                               destination: PostList(posts: model.allPosts))
                NavigationLink("PostForEach",
                               destination:PostForEach(posts:model.allPosts))
                NavigationLink("PostForEach lazy",
                               destination:PostForEach(posts:model.allPosts, lazy: true))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model:ContentViewModel())
    }
}
