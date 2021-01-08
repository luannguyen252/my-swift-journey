//
//  PostCell.swift
//  SwiftUIReactions
//
//  Created by Luan Nguyen on 08/01/2021.
//

import SwiftUI
import Reactions

struct Post: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
}

struct PostCell: View {
    let post: Post
    
    let reactions = [
        Reaction(name: "hand.thumbsup.fill", color: Color(red: 0, green: 0.8, blue: 1)),
        Reaction(name: "smiley.fill", color: .yellow),
        Reaction(name: "flame.fill", color: .red),
        Reaction(name: "star.fill", color: .yellow),
        Reaction(name: "heart.fill", color: Color(red: 1, green: 0.4, blue: 0.3)),
    ]
    
    var body: some View {
        VStack {
            Text(post.title)
                .font(.title)
                .foregroundColor(.primary)
            Text(post.subtitle)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Image(post.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
            
            Reactions(reactions) { reaction in
                print("selected reaction \(reaction)")
            }
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: .init(title: "A Post", subtitle: "subtitle of a post", imageName: "1"))
    }
}
