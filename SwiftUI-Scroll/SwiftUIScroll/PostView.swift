//
//  PostView.swift
//  SwiftUIScroll
//
//  Created by Gualtiero Frigerio on 25/08/2020.
//

import SwiftUI

let emptyPost = Post(userId: 0, id: 0, title: "", body: "")

struct PostView: View {
    var post:Post
    
    var body: some View {
        VStack {
            HStack {
                Text("\(post.userId)")
                Text(post.title)
            }
            Text(post.body).foregroundColor(.gray)
        }
        .onAppear {
            print("onAppear post = \(post.id) \(post.userId)")
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post:emptyPost)
    }
}
